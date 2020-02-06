require 'test_helper'

class TimeSecondTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TimeSecond::VERSION
  end

  T1 = 2 * 60 * 60 + 1 * 60 + 39
  T2 = 2 * 60 * 60 + 1 * 60 + 41.258

  def setup
    @t1 = TimeSecond.new(T1)
    @t2 = TimeSecond.new(T2)
  end

  def test_hour
    assert_equal @t1.hour, 2
    assert_equal @t2.hour, 2
  end

  def test_minute
    assert_equal @t1.minute, 1
    assert_equal @t2.minute, 1
  end

  def test_second
    assert_equal @t1.second, 39
    assert_equal @t2.second, 41
  end

  def test_hms
    assert_equal @t1.hms, '02:01:39'
    assert_equal @t2.hms, '02:01:41'
  end

  def test_hm
    assert_equal @t1.hm, '02:01'
    assert_equal @t2.hm, '02:01'
  end

  def test_parse
    assert_instance_of TimeSecond, TimeSecond.parse('02:01:39')
    assert_equal @t1.hour, 2
    assert_equal @t1.minute, 1
    assert_equal @t1.second, 39
  end

  def test_parse_with_invalid_format
    assert_raises ArgumentError do
      TimeSecond.parse('020139')
    end
  end

  def test_compares
    assert @t1 < @t2
  end

  def test_equality
    assert @t1 == T1
    assert @t1 == TimeSecond.new(T1)
    assert @t1 == Float(T1)
    assert @t1 != T2
    assert @t1 != @t2
  end

  def test_add
    assert_instance_of TimeSecond, TimeSecond.new(7) + 3
    assert_equal TimeSecond.new(7) + TimeSecond.new(3), TimeSecond.new(10)
    assert_equal TimeSecond.new(7.1) + 3, TimeSecond.new(10.1)
  end

  def test_subtract
    assert_instance_of TimeSecond, TimeSecond.new(7) - 3
    assert_equal TimeSecond.new(7) - TimeSecond.new(3), TimeSecond.new(4)
    assert_equal TimeSecond.new(7.1) - 3, TimeSecond.new(4.1)
  end

  def test_multiple
    assert_instance_of TimeSecond, TimeSecond.new(7) * 3
    assert_equal TimeSecond.new(7) * 3, TimeSecond.new(21)
  end

  def test_divide
    assert_instance_of TimeSecond, TimeSecond.new(7) / 3
    assert_equal TimeSecond.new(7) / 3, TimeSecond.new(7 / 3)
  end

  def test_modulo
    assert_instance_of TimeSecond, TimeSecond.new(7) % 3
    assert_equal TimeSecond.new(7) % 3, 1
  end
end
