require 'test_helper'

class RateStoreTest < Minitest::Test
  TEST_XML = '
  <?xml version="1.0" encoding="UTF-8"?>
  <gesmes:Envelope xmlns:gesmes="http://www.gesmes.org/xml/2002-08-01" xmlns="http://www.ecb.int/vocabulary/2002-08-01/eurofxref">
      <gesmes:subject>Reference rates</gesmes:subject>
      <gesmes:Sender>
          <gesmes:name>European Central Bank</gesmes:name>
      </gesmes:Sender>
      <Cube>
          <Cube time="2017-06-02">
              <Cube currency="USD" rate="1.1217" />
              <Cube currency="GBP" rate="0.87268" />
          </Cube>
          <Cube time="2017-06-01">
              <Cube currency="USD" rate="1.1219" />
              <Cube currency="GBP" rate="0.8723" />
          </Cube>
      </Cube>
  </gesmes:Envelope>'

  def setup
    @store = FxPotato::RateStore.new(TEST_XML)
  end

  def test_get_returns_something
    assert @store.get(Date.new(2017, 6, 1), 'GBP')
  end

  def test_get_returns_the_correct_rate
    assert_equal 0.8723, @store.get(Date.new(2017, 6, 1), 'GBP')
    assert_equal 1.1219, @store.get(Date.new(2017, 6, 1), 'USD')
  end
end
