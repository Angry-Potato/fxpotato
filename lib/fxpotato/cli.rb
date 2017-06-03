require 'thor'
require 'fxpotato'

module FxPotato
  class CLI < Thor
    desc "getrate BASE TARGET", "Gets the foreign exchange rate for the given currencies on the chosen date."
    method_option :date, :aliases => "-d"
    def getrate(base, target)
      puts FxPotato.at(options[:date] || Date.today, base, target)
    end
  end
end
