require 'test_helper'
require 'date'

USD_06_02 = 1.1217
GBP_06_02 = 0.87268
USD_06_01 = 1.1219
GBP_06_01 = 0.8723

class FxPotatoTest < Minitest::Test

  def setup
    FxPotato.repo = RepoStub
  end

  def test_that_it_has_a_version_number
    refute_nil ::FxPotato::VERSION
  end

  def test_at_returns_something
    assert FxPotato.at(Date.today, 'GBP', 'USD')
  end

  def test_at_returns_nil_rates_for_nil_inputs
    assert_nil FxPotato.at(Date.today, nil, 'USD')['base']['rate']
    assert_nil FxPotato.at(Date.today, 'GBP', nil)['target']['rate']
  end

  def test_at_returns_correct_rates
    expected_02_GBP_to_USD = FxPotato::RateCalculator.calculate(GBP_06_02, USD_06_02)
    actual = FxPotato.at(Date.today, 'GBP', 'USD')['rate']
    assert_equal expected_02_GBP_to_USD, actual
  end

  def test_at_is_case_insensitive
    expected_02_GBP_to_USD = FxPotato::RateCalculator.calculate(GBP_06_02, USD_06_02)
    actual = FxPotato.at(Date.today, 'GbP', 'usd')['rate']
    assert_equal expected_02_GBP_to_USD, actual
  end

  def test_at_defaults_to_todays_date
    expected_02_GBP_to_USD = FxPotato::RateCalculator.calculate(GBP_06_02, USD_06_02)
    actual = FxPotato.at(nil, 'GbP', 'usd')['rate']
    assert_equal expected_02_GBP_to_USD, actual
  end

  def test_at_returns_nil_rates_on_unfound_data
    assert_nil FxPotato.at(Date.new(3333, 6, 2), 'GBP', 'USD')['rate']
    assert_nil FxPotato.at(Date.today, 'narp', 'USD')['base']['rate']
    assert_nil FxPotato.at(Date.today, 'GBP', 'nil')['target']['rate']
  end
end
