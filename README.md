# FxPotato

The Foreign Exchange currency rates looker-upper. Potato style.

Uses last daily feed from [European Central Bank](http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml), and exposes a simple interface to get the conversion rates for one currency to another on a given day.

An example of this gem in use can be found at [FxPotatoWeb](https://fxpotatoweb.herokuapp.com/). Source code for the site is [here](https://github.com/Angry-Potato/fxpotatoweb).

[Available on RubyGems.org](https://rubygems.org/gems/fxpotato)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fxpotato'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fxpotato

### Configuration
FxPotato takes rates from the [ECB website](http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml). It then saves this data into a `rates.xml` file under the `data` directory in the root of your project. To configure either of those destinations, set the corresponding environment variables:
`FXPOTATO_DATA_DIR` and `DATA_FILE`.

To change the feed, set the `FXPOTATO_DATA_SOURCE_URL` environment variable to the new URL, and if the structure of the xml is different (or indeed not XML at all, which is also totes cool), set `FxPotato.repo` to equal an instance of a custom class of your own writing for locating rates in the new structure. Make sure to set `FxPotato.repo = YourClass.new` before you use the other functionality in `FxPotato`.

The `repo` class you write must implement the `find` method with this signature:

```
def find(date = Date object, currency = Currency key, e.g. 'GBP')
  // your wonderful code here
end
```

If using the crontab functionality, configure your own schedule by editing the `config/schedule.rb` file, as per the [whenever documentation](https://github.com/javan/whenever#example-schedulerb-file).

## Usage
### Crontab
FxPotato comes with optional crontab functionality to keep itself up to date. To enable the cron job, run the rake task `rake fxpotato:update_crontab`. Then verify the job is in your crontab by running `crontab -l`.

If you decide this was a big mistake and wish to purify your crontab of fxpotato, then run the rake task `rake fxpotato:clear_crontab`, and verify again.

The details of the cron job is configurable, as mentioned before, by editing the `config/schedule.rb` file as per the [whenever documentation](https://github.com/javan/whenever#example-schedulerb-file).

### In your ruby app
Assuming you successfully followed the install instructions, and are still reading this exciting documentation with much reckless abandon, steady yourself!

Now. Using the FxPotato gem in your app is as simple as:

```
FxPotato.at('GBP', 'USD', date)
```

The date parameter is a `Date` object, which will default to today if nil, and the currency keys are simply strings. The gem is case insensitive, so don't worry about that.

This will return a hash that looks like this:

```
{
  "date" => #<Date: 2017-06-06 ((2457911j,0s,0n),+0s,2299161j)>, // <-- a Date object
  "base" => {
    "key" => "GBP",
    "rate" => 0.87268
  },
  "target" => {
    "key" => "USD",
    "rate" => 1.1217
  },
  "rate" => 1.2853508731722967
}
```

If for any reason the call was unsuccessful, the root `rate` will be nil, and the unlocatable rate(s) will also be nil.

### CLI
Get foreign exchange rates on the command line with the following command:

```
fxpotato getrate <base_currency> <target_currency> -d <YYYY-MM-DD>

e.g.
fxpotato getrate GBP USD -d 2017-06-02
```

The `-d` option is not required, and will default to today if not specified.

Or you can use `fxpotato help getrate` to get slightly more detailed help.

## Development
To run tests, run the rake task `rake test`, this will run unit and feature tests. If you have docker installed, you can run all tests in a container using the rake task `rake docker_test`. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fxpotato. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FxPotato project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fxpotato/blob/master/CODE_OF_CONDUCT.md).
