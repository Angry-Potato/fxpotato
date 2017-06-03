require 'fxpotato/version'
require 'fxpotato/paths'
require 'fxpotato/rate_store'
require 'fxpotato/rate_fetcher'
require 'fxpotato/rate_calculator'

module FxPotato
  def self.at(date, from_currency, to_currency)
    raise "Must specify date" if date.nil?
    raise "Must specify from_currency" if from_currency.nil?
    raise "Must specify to_currency" if to_currency.nil?
    from = @rate_store.get(date, from_currency)
    to = @rate_store.get(date, to_currency)
    RateCalculator.calculate(from, to)
  end

  def self.fetch_new_rates
    Dir.mkdir DATA_DIRECTORY if !File.exists? DATA_DIRECTORY
    destination = File.join(DATA_DIRECTORY, DATA_FILE)
    RateFetcher.fetch(DATA_SOURCE_URL, destination)
  end

  module_function
  def rate_store; @rate_store ||= RateStore.new() end
  def rate_store= v; @rate_store = v end
end
