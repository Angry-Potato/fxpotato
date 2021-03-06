require 'test_helper'

class XmlRepoTest < Minitest::Test
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
    @repo = FxPotato::XmlRepo.new(TEST_XML)
  end

  def test_find_returns_something
    assert @repo.find(Date.new(2017, 6, 1), 'GBP')
  end

  def test_find_returns_the_correct_rate
    assert_equal GBP_06_02, @repo.find(Date.new(2017, 6, 2), 'GBP')
    assert_equal USD_06_02, @repo.find(Date.new(2017, 6, 2), 'USD')
    assert_equal GBP_06_01, @repo.find(Date.new(2017, 6, 1), 'GBP')
    assert_equal USD_06_01, @repo.find(Date.new(2017, 6, 1), 'USD')
  end

  def test_find_returns_nil_when_currency_not_found
    assert_nil @repo.find(Date.new(2017, 6, 1), 'PLOP')
  end
end
