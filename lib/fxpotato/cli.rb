require 'thor'
require 'fxpotato'

module FxPotato
  class CLI < Thor
    desc "getrate DATE FROM_CURRENCY TO_CURRENCY", "Gets the foreign exchange rate for the given currencies on the chosen date."
    def getrate(date, from, to)
      puts FxPotato.at(date, from, to)
    end
  end
end
