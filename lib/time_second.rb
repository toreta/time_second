# Integer as a Second
class TimeSecond
  VERSION = '0.1.0'.freeze

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

  # new
  #
  # @param [Integer] second
  #
  # @return [TimeSecond] new object
  def initialize(sec)
    @time = sec.to_i
  end

  # Return hour
  #
  # @return [Integer] Hour (0 ~ )
  def hour
    @time / 60 / 60
  end

  # Return minute
  #
  # @return [Integer] Minute (0 ~ 59)
  def minute
    @time / 60 % 60
  end

  # Return second
  #
  # @return [Integer] TimeSecond (0 ~ 59)
  def second
    @time % 60
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
end