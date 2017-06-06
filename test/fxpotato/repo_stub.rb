class RepoStub
  def self.find(date, currency)
    return GBP_06_02 if date == Date.today && currency == 'GBP'
    return USD_06_02 if date == Date.today && currency == 'USD'
    return GBP_06_01 if date == Date.new(2017, 6, 1) && currency == 'GBP'
    return USD_06_01 if date == Date.new(2017, 6, 1) && currency == 'USD'
    nil
  end
end
