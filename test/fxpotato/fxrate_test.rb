require 'test_helper'

class FxRateTest < Minitest::Test

  def setup
    @base_key, @base_rate, @target_key, @target_rate, @date, @rate =
      'GBP', 0.89, 'USD', 1.12, Date.new(2017, 6, 2), 1.4

    @fxrate = FxPotato::FxRate.new(@base_key, @base_rate, @target_key, @target_rate, @date, @rate)
  end

  def test_serialize_returns_something
    assert @fxrate.serialize
  end

  def test_serialize_returns_correct_values
    actual = @fxrate.serialize
    assert_equal @base_key, actual['base']['key']
    assert_equal @base_rate, actual['base']['rate']
    assert_equal @target_key, actual['target']['key']
    assert_equal @target_rate, actual['target']['rate']
    assert_equal @date, actual['date']
    assert_equal @rate, actual['rate']
  end
end
