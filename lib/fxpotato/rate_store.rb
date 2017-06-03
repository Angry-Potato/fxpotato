module FxPotato
  class RateStore
    def self.get(repo, date, currency)
      repo.find(date, currency)
    end
  end
end
