require 'test_helper'

class TimeSecondTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TimeSecond::VERSION
  end

  def setup
    @second_i = TimeSecond.new(2 * 60 * 60 + 1 * 60 + 39)
    @second_f = TimeSecond.new(2 * 60 * 60 + 1 * 60 + 39.258)
  end

  def test_hour
    assert_equal @second_i.hour, 2
    assert_equal @second_f.hour, 2
  end

  def test_minute
    assert_equal @second_i.minute, 1
    assert_equal @second_f.minute, 1
  end

  def test_second
    assert_equal @second_i.second, 39
    assert_equal @second_f.second, 39
  end

  def test_hms
    assert_equal @second_i.hms, '02:01:39'
    assert_equal @second_f.hms, '02:01:39'
  end

  def test_hm
    assert_equal @second_i.hm, '02:01'
    assert_equal @second_f.hm, '02:01'
  end

  def test_parse
    assert_instance_of TimeSecond, TimeSecond.parse('02:01:39')
  end

  def test_parse_with_invalid_format
    assert_raises ArgumentError do
      TimeSecond.parse('020139')
    end
  end

  def test_compares
    second2 = TimeSecond.new(2 * 60 * 60 + 1 * 60 + 41.839)
    assert @second_i < second2
  end
end
