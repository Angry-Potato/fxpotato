require 'fxpotato/version'
require 'fxpotato/rate_calculator'
require 'fxpotato/rate_store'

module FxPotato
  def self.at(date, from_currency, to_currency)
    raise "Must specify date" if date.nil?
    raise "Must specify from_currency" if from_currency.nil?
    raise "Must specify to_currency" if to_currency.nil?
    true
  end

  module_function
  def rate_store; @rate_store ||= RateStore.new() end
  def rate_store= v; @rate_store = v end
end
