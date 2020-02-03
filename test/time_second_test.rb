require 'test_helper'

class TimeSecondTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TimeSecond::VERSION
  end

  def setup
    @second = TimeSecond.new(2 * 60 * 60 + 1 * 60 + 39)
  end

  def test_hour
    assert @second.hour, 2
  end

  def test_minute
    assert @second.hour, 1
  end

  def test_second
    assert @second.second, 39
  end

  def test_hms
    assert @second.second, '02:01:39'
  end

  def test_hm
    assert @second.second, '02:01'
  end

  def test_parse
    assert_instance_of TimeSecond, TimeSecond.parse('02:01:39')
  end

  def test_parse_with_invalid_format
    assert_raises ArgumentError do
      TimeSecond.parse('020139')
    end
  end
end
