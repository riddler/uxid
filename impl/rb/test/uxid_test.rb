require "test_helper"

class UXIDTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::UXID::VERSION
  end

  def test_generate_with_no_options
    uxid = UXID.generate

    assert_equal 26, uxid.length
  end

  def test_generate_with_size_and_prefix
    uxid = UXID.generate size: :xs, prefix: "foo"
    # foo_TTTTTTTTTT

    assert_equal 14, uxid.length
  end
end
