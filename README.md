# FxPotato

The Foreign Exchange currency rates looker-upper. Potato style.

Uses last daily feed from European Central Bank website, and exposes a simple interface to get the conversion rates for one currency to another on a given day.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fxpotato'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fxpotato

## Usage

### CLI
Get foreign exchange rates on the command line with the following command:

```
fxpotato getrate <base_currency> <target_currency> -d <YYYY-MM-DD>

e.g.
fxpotato getrate GBP USD -d 2017-06-02
```

The `-d` option is not required, and will default to today if not specified.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fxpotato. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FxPotato project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fxpotato/blob/master/CODE_OF_CONDUCT.md).
