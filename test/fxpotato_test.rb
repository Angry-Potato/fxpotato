require 'test_helper'
require 'date'

class FxPotatoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FxPotato::VERSION
  end

  def test_at_returns_something
    assert FxPotato.at(Date.today, 'GBP', 'USD')
  end

  def test_at_raises_on_nil_inputs
    assert_raises(Exception) { FxPotato.at(nil, 'GBP', 'USD') }
    assert_raises(Exception) { FxPotato.at(Date.today, nil, 'USD') }
    assert_raises(Exception) { FxPotato.at(Date.today, 'GBP', nil) }
  end
end
