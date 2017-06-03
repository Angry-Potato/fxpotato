require 'fxpotato/version'
require 'fxpotato/paths'
require 'fxpotato/xml_repo'
require 'fxpotato/rate_store'
require 'fxpotato/rate_fetcher'
require 'fxpotato/rate_calculator'

module FxPotato
  def self.at(date, from_currency, to_currency)
    raise "Must specify date" if date.nil?
    raise "Must specify from_currency" if from_currency.nil?
    raise "Must specify to_currency" if to_currency.nil?

    from = RateStore.get(self.repo, date, from_currency)
    raise "Unable to find #{from_currency} on #{date}" if from.nil?
    to = RateStore.get(self.repo, date, to_currency)
    raise "Unable to find #{to_currency} on #{date}" if to.nil?
    RateCalculator.calculate(from, to)
  end

  def self.fetch_new_rates
    Dir.mkdir DATA_DIRECTORY if !File.exists? DATA_DIRECTORY
    destination = File.join(DATA_DIRECTORY, DATA_FILE)
    RateFetcher.fetch(DATA_SOURCE_URL, destination)
  end

  module_function
  def repo; @repo ||= XmlRepo.new(nil) end
  def repo= v; @repo = v end
end
