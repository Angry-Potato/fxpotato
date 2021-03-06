require 'test_helper'

class RateStoreTest < Minitest::Test
  def test_get_returns_something
    assert FxPotato::RateStore.get(RepoStub, Date.new(2017, 6, 1), 'GBP')
  end

  def test_get_from_repo_returns_correct_value
    expected = RepoStub.find(Date.new(2017, 6, 1), 'USD')
    assert_equal expected, FxPotato::RateStore.get(RepoStub, Date.new(2017, 6, 1), 'USD')
  end
end
