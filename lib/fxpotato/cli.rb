require 'thor'
require 'fxpotato'
require 'date'
require 'cli_formatter'

module FxPotato
  class CLI < Thor
    desc "getrate BASE TARGET", "Gets the foreign exchange rate for the given currencies on the chosen date."
    method_option :date, :aliases => "-d", :desc => "A specific date to get the rate for, e.g. -d 2017-05-29. Defaults to today."
    def getrate(base, target)
      date = options[:date] || Date.today
      begin
        fxrate = FxPotato.at(date, base, target)
        puts CLIFormatter.result(fxrate)
      rescue RuntimeError => message
        puts message
      end
    end
  end
end
