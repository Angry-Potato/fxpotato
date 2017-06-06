require 'fxpotato/version'
require 'fxpotato/paths'
require 'fxpotato/xml_repo'
require 'fxpotato/rate_store'
require 'fxpotato/rate_fetcher'
require 'fxpotato/rate_calculator'
require 'fxpotato/fxrate'
require "fxpotato/railtie" if defined?(Rails)
require 'date'

module FxPotato
  def self.at(base_key, target_key, date = nil)
    base_key = upcase_if_not_nil(base_key)
    target_key = upcase_if_not_nil(target_key)
    date ||= Date.today

    base_rate = RateStore.get(self.repo, date, base_key)
    target_rate = RateStore.get(self.repo, date, target_key)

    FxRate.new(
      base_key,
      base_rate,
      target_key,
      target_rate,
      date,
      RateCalculator.calculate(base_rate, target_rate)
    ).serialize
  end

  def self.fetch_new_rates
    data_dir = Paths.data_directory(defined?(Rails))
    Dir.mkdir data_dir if !File.exists? data_dir
    destination = File.join(data_dir, DATA_FILE)
    RateFetcher.fetch(Paths.data_source_url, destination)
  end

  def self.upcase_if_not_nil(str)
    str.nil? ? nil : str.upcase
  end

  module_function
  def repo; @repo ||= XmlRepo.new end
  def repo= v; @repo = v end
end
