require 'test_helper'
require 'date'

class FxPotatoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FxPotato::VERSION
  end

  def test_at_returns_something
    assert FxPotato.at(Date.today, 'GBP', 'USD')
  end
end
