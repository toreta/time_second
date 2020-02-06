# frozen_string_literal: true

# Make it easy to handle numeric value as seconds.
class TimeSecond < Numeric
  VERSION = '0.1.0'

  include Comparable

  # Parse 'HH:MM:SS' format string and return its object
  #
  # @param [String] str 'HH:MM:SS' or 'HH:MM'
  #
  # @return [TimeSecond]
  def self.parse(str)
    unless str.match(/\A\d{1,2}:\d{2}(?:\:\d{2})?\z/)
      raise ArgumentError, 'Invalid string format'
    end

    h, m, s = str.split(':')
    new(h.to_i * 60 * 60 + m.to_i * 60 + s.to_i)
  end

  def initialize(time) # :nodoc:
    @time = time
  end

  # Returns integer value of seconds
  #
  # @return [Integer] seconds
  def to_i
    @time.to_int
  end

  # Returns float value of seconds
  #
  # @return [Float] seconds
  def to_f
    @time.to_f
  end

  # Return hour
  #
  # @return [Integer] Hour (0 ~ )
  def hour
    @time.to_i / 60 / 60
  end

  # Return minute
  #
  # @return [Integer] Minute (0 ~ 59)
  def minute
    @time.to_i / 60 % 60
  end

  # Return second
  #
  # @return [Integer] TimeSecond (0 ~ 59)
  def second
    @time.to_i % 60
  end

  # Return 'HH:MM:SS' format string
  #
  # @param [String] sep Seperator string. Default is ':'.
  #
  # @return [String] 'HH:MM:SS'
  def hms(sep = ':')
    "%02d#{sep}%02d#{sep}%02d" % [hour, minute, second]
  end

  # Return 'HH:MM' format string
  #
  # @param [String] sep Seperator string. Default is ':'.
  #
  # @return [String] 'HH:MM'
  def hm(sep = ':')
    "%02d#{sep}%02d" % [hour, minute]
  end

  # Compares one TimeSecond and another or a Numeric to this TimeSecond.
  def <=>(other)
    @time <=> other
  end

  # Returns true if other is with the same time.
  def ==(other)
    @time.to_f == other.to_f
  end

  # Adds another TimeSecond or Numeric to this TimeSecond.
  def +(other)
    r, l = @time.coerce(other)
    self.class.new(l + r)
  end

  # Subtracts another TimeSecond or Numeric from this TimeSecond.
  def -(other)
    r, l = @time.coerce(other)
    self.class.new(l - r)
  end

  # Multiple self by a Numeric and returns a new TimeSecond.
  def *(other)
    r, l = @time.coerce(other)
    self.class.new(l * r)
  end

  # Divides self by a Numeric and returns a new TimeSecond.
  def /(other)
    r, l = @time.coerce(other)
    self.class.new(l / r)
  end

  # Returns the modulo of this by another TimeSecond or Numeric.
  def %(other)
    r, l = @time.coerce(other)
    self.class.new(l % r)
  end
end
