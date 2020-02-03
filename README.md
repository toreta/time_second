[![Build Status](https://travis-ci.com/toreta/time_second.svg?branch=master)](https://travis-ci.com/toreta/time_second)
[![Maintainability](https://api.codeclimate.com/v1/badges/73a1cfd234b42457bc79/maintainability)](https://codeclimate.com/github/toreta/time_second/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/73a1cfd234b42457bc79/test_coverage)](https://codeclimate.com/github/toreta/time_second/test_coverage)

# TimeSecond

Make it easy to handle integer as seconds.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'time_second'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install time_second

## Usage


``` ruby
# New from Integer
t = TimeSecond.new(2 * 60 * 60 + 1 * 60 + 39) # 2:01:39
t.hour   #=> 2
t.minute #=> 1
t.second #=> 39
t.hms    #=> '02:01:39'
t.hm     #=> '02:01'

# New from String
t = TimeSecond.parse('02:01:39')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/toreta/time_second](https://github.com/toreta/time_second).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
