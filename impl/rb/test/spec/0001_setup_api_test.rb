# AUTOGENERATED FILE - DO NOT EDIT

require "test_helper"

class UXID0001Test < Minitest::Test
  # UXID Spec 0001 - setup api
  # Ensure the implementation is setup and that the generated tests will work. Makes sure the correct API is in place.





  # UXID decode exists
  def test_0001_setup_api_api
    result = UXID.decode "01E9VB3RWNAR89HSKMS84K9HCS"
    refute_nil result
  end




  # returns a UXID with input
  def test_returns_a_uxid_with_input
    input_string = "01E9VB3RWNAR89HSKMS84K9HCS"

    uxid = UXID.decode input_string
    assert_kind_of ::UXID::Model, uxid
    assert_equal "01E9VB3RWNAR89HSKMS84K9HCS", uxid.encoded


  end


  # rejects blank strings
  def test_rejects_blank_strings
    input_string = ""

    error = assert_raises { UXID.decode input_string }
    assert_equal "input is required", error.message

  end


end