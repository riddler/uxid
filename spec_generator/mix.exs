defmodule UXIDSpec.MixProject do
  use Mix.Project

  def project do
    [
      app: :uxid_spec,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      docs: [extras: ["README.md"]],
      description: description(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  def description, do: "UXID Spec Generator"

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:solid, "~> 0.5"},
      {:yaml_elixir, "~> 2.4"}
    ]
  end
end
