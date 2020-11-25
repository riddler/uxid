require "test_helper"

class UXIDRandSizeTest < Minitest::Test
  def test_generate_rand_size_0
    uxid = UXID.generate rand_size: 0

    assert_equal 10, uxid.length
  end

  def test_generate_rand_size_1
    uxid = UXID.generate rand_size: 1

    assert_equal 12, uxid.length
  end

  def test_generate_rand_size_2
    uxid = UXID.generate rand_size: 2

    assert_equal 14, uxid.length
  end

  def test_generate_rand_size_3
    uxid = UXID.generate rand_size: 3

    assert_equal 15, uxid.length
  end

  def test_generate_rand_size_4
    uxid = UXID.generate rand_size: 4

    assert_equal 17, uxid.length
  end

  def test_generate_rand_size_5
    uxid = UXID.generate rand_size: 5

    assert_equal 18, uxid.length
  end

  def test_generate_rand_size_6
    uxid = UXID.generate rand_size: 6

    assert_equal 20, uxid.length
  end

  def test_generate_rand_size_7
    uxid = UXID.generate rand_size: 7

    assert_equal 22, uxid.length
  end

  def test_generate_rand_size_8
    uxid = UXID.generate rand_size: 8

    assert_equal 23, uxid.length
  end

  def test_generate_rand_size_9
    uxid = UXID.generate rand_size: 9

    assert_equal 25, uxid.length
  end

  def test_generate_rand_size_10
    uxid = UXID.generate rand_size: 10

    assert_equal 26, uxid.length
  end
end
