require 'test_helper'
require 'date'

class FxPotatoTest < Minitest::Test
  USD_06_02 = 1.1217
  GBP_06_02 = 0.87268
  USD_06_01 = 1.1219
  GBP_06_01 = 0.8723
  TEST_XML = "
  <?xml version=\"1.0\" encoding=\"UTF-8\"?>
  <gesmes:Envelope xmlns:gesmes=\"http://www.gesmes.org/xml/2002-08-01\" xmlns=\"http://www.ecb.int/vocabulary/2002-08-01/eurofxref\">
      <gesmes:subject>Reference rates</gesmes:subject>
      <gesmes:Sender>
          <gesmes:name>European Central Bank</gesmes:name>
      </gesmes:Sender>
      <Cube>
          <Cube time=\"2017-06-02\">
              <Cube currency=\"USD\" rate=\"#{USD_06_02}\" />
              <Cube currency=\"GBP\" rate=\"#{GBP_06_02}\" />
          </Cube>
          <Cube time=\"2017-06-01\">
              <Cube currency=\"USD\" rate=\"#{USD_06_01}\" />
              <Cube currency=\"GBP\" rate=\"#{GBP_06_01}\" />
          </Cube>
      </Cube>
  </gesmes:Envelope>"

  def setup
    FxPotato.repo = FxPotato::XmlRepo.new(TEST_XML)
  end

  def test_that_it_has_a_version_number
    refute_nil ::FxPotato::VERSION
  end

  def test_at_returns_something
    assert FxPotato.at(Date.new(2017, 6, 2), 'GBP', 'USD')
  end

  def test_at_returns_nil_rates_for_nil_inputs
    assert_nil FxPotato.at(nil, 'GBP', 'USD')['rate']
    assert_nil FxPotato.at(Date.today, nil, 'USD')['base']['rate']
    assert_nil FxPotato.at(Date.today, 'GBP', nil)['target']['rate']
  end

  def test_at_returns_correct_rates
    expected_02_GBP_to_USD = FxPotato::RateCalculator.calculate(GBP_06_02, USD_06_02)
    actual = FxPotato.at(Date.new(2017, 6, 2), 'GBP', 'USD')['rate']
    assert_equal expected_02_GBP_to_USD, actual
  end

  def test_at_returns_nil_rates_on_unfound_data
    assert_nil FxPotato.at(Date.new(3333, 6, 2), 'GBP', 'USD')['rate']
    assert_nil FxPotato.at(Date.new(2017, 6, 2), 'narp', 'USD')['base']['rate']
    assert_nil FxPotato.at(Date.new(2017, 6, 2), 'GBP', 'nil')['target']['rate']
  end
end
