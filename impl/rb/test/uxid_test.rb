require "test_helper"

class UXIDTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::UXID::VERSION
  end
end
