require "test_helper"

class UXIDSizeTest < Minitest::Test
  def test_generate_size_xs
    uxid = UXID.generate size: :xs

    assert_equal 10, uxid.length
  end

  def test_generate_size_xsmall
    uxid = UXID.generate size: :xsmall

    assert_equal 10, uxid.length
  end


  def test_generate_size_s
    uxid = UXID.generate size: :s

    assert_equal 14, uxid.length
  end

  def test_generate_size_small
    uxid = UXID.generate size: :small

    assert_equal 14, uxid.length
  end


  def test_generate_size_m
    uxid = UXID.generate size: :m

    assert_equal 18, uxid.length
  end

  def test_generate_size_medium
    uxid = UXID.generate size: :medium

    assert_equal 18, uxid.length
  end


  def test_generate_size_l
    uxid = UXID.generate size: :l

    assert_equal 22, uxid.length
  end

  def test_generate_size_large
    uxid = UXID.generate size: :large

    assert_equal 22, uxid.length
  end


  def test_generate_size_xl
    uxid = UXID.generate size: :xl

    assert_equal 26, uxid.length
  end

  def test_generate_size_xlarge
    uxid = UXID.generate size: :xlarge

    assert_equal 26, uxid.length
  end
end
