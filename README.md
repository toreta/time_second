[![Build Status](https://travis-ci.com/toreta/second.svg?branch=master)](https://travis-ci.com/toreta/second)
[![Maintainability](https://api.codeclimate.com/v1/badges/70795f9570f5e4cc2909/maintainability)](https://codeclimate.com/github/toreta/second/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/70795f9570f5e4cc2909/test_coverage)](https://codeclimate.com/github/toreta/second/test_coverage)

# Second

Make it easy to handle integer as seconds.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'second'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install second

## Usage


``` ruby
# New from Integer
t = Second.new(2 * 60 * 60 + 1 * 60 + 39) # 2:01:39
t.hour   #=> 2
t.minute #=> 1
t.second #=> 39
t.hms    #=> '02:01:39'
t.hm     #=> '02:01'

# New from String
t = Second.parse('02:01:39')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/toreta/second](https://github.com/toreta/second).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
