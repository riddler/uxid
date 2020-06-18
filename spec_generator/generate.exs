defmodule SpecGenerator do
  @root_spec_dir "../spec"

  defmodule APITest do
    defstruct [:name, :method, args: nil]
  end

  defmodule DecoderTest do
    defstruct [:name, :input, error_message: nil, verify: %{}]
  end

  defmodule Spec do
    defstruct [
      :basename,
      :language,
      :extension,
      :group_folder,
      :group_id,
      :group_name,
      :spec_id,
      :spec_name,
      :description,
      api_tests: [],
      decoder_tests: []
    ]

    def load(language, [_root, group_folder, spec_file] = path_segments) do
      {group_id, group_name} = split(group_folder)
      basename = Path.basename(spec_file, ".yaml")
      {spec_id, spec_name} = split(basename)

      {:ok, spec_map} = YamlElixir.read_from_file(Path.join(path_segments), atoms: true)

      api_tests =
        if Map.has_key?(spec_map, :api_tests),
          do: Enum.map(spec_map.api_tests, &struct(APITest, &1)),
          else: []

      decoder_tests =
        if Map.has_key?(spec_map, :decoder_tests),
          do: Enum.map(spec_map.decoder_tests, &struct(DecoderTest, &1)),
          else: []

      spec_input =
        Map.merge(spec_map, %{
          language: language,
          extension: language,
          basename: basename,
          group_folder: group_folder,
          group_id: group_id,
          group_name: group_name,
          spec_id: spec_id,
          spec_name: spec_name,
          api_tests: api_tests,
          decoder_tests: decoder_tests
        })

      struct(__MODULE__, spec_input)
    end

    def render_context(%__MODULE__{api_tests: api_tests, decoder_tests: decoder_tests} = spec) do
      map =
        Map.from_struct(%{
          spec
          | api_tests: Enum.map(api_tests, fn test -> Map.from_struct(test) end),
            decoder_tests: Enum.map(decoder_tests, fn test -> Map.from_struct(test) end)
        })

      string_keys(map)
    end

    defp string_keys(map) when is_binary(map), do: map

    defp string_keys(map) do
      for {key, val} <- map, into: %{} do
        new_key = to_string(key)

        new_val =
          cond do
            is_binary(val) -> val
            is_list(val) -> Enum.map(val, &string_keys(&1))
            is_map(val) -> string_keys(val)
            true -> val
          end

        {new_key, new_val}
      end
    end

    def generated_path(%__MODULE__{language: language} = spec) do
      Path.join(["generated", language, filename(spec)])
    end

    def filename(%__MODULE__{
          language: language,
          group_name: group_name,
          spec_name: spec_name,
          group_id: group_id,
          spec_id: spec_id
        }) do
      case language do
        "ts" ->
          Enum.join(["#{group_id}#{spec_id}", group_name, spec_name], "-") <>
            ".test.#{extension(language)}"

        _ ->
          Enum.join(
            ["#{group_id}#{spec_id}", group_name, spec_name, "test.#{extension(language)}"],
            "_"
          )
      end
    end

    defp extension(language) do
      case language do
        "ex" -> "exs"
        lang -> lang
      end
    end

    def impl_path(%__MODULE__{language: language} = spec) do
      Path.join(["../impl", language, "test/spec", filename(spec)])
    end

    defp split(string) do
      [id, name] = String.split(string, "_")
      {id, name}
    end
  end

  defp groups, do: Path.wildcard("??_*")
  defp specs(group), do: File.ls!("#{group}")

  def process(language, touchfile) do
    template = spec_template(language)

    File.cd!(@root_spec_dir)

    for group_folder <- groups() do
      for spec_file <- specs(group_folder) do
        spec = Spec.load(language, [".", group_folder, spec_file])

        context = Spec.render_context(spec)

        rendered =
          template
          |> Solid.render(context)
          |> to_string

        full_output_path =
          spec
          |> Spec.generated_path()

        full_output_path |> Path.dirname() |> File.mkdir_p!()
        File.write!(full_output_path, rendered)

        full_output_path =
          spec
          |> Spec.impl_path()

        full_output_path |> Path.dirname() |> File.mkdir_p!()
        File.write!(full_output_path, rendered)

        IO.puts("Wrote #{full_output_path}")
      end
    end

    full_touchfile = Path.expand(touchfile, ".")
    File.touch!(full_touchfile)
  end

  defp spec_template(language) do
    with template_path <- "templates/#{language}_spec.liquid",
         template_contents <- File.read!(template_path) do
      Solid.parse!(template_contents)
    end
  end
end

[language, touchfile] = System.argv()
SpecGenerator.process(language, touchfile)
