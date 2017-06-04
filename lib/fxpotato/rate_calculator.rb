module FxPotato
  class RateCalculator
    def self.calculate(base, target)
      return nil unless base && numeric?(base) && target && numeric?(target)
      target / base
    end

    def self.numeric?(thing)
      Float(thing) != nil rescue false
    end
  end
end
