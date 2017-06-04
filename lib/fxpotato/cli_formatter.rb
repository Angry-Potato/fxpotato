module FxPotato
  class CLIFormatter
    def self.result(fxrate)
      fxrate && fxrate['rate'] ? pass_message(fxrate) : fail_message(fxrate)
    end

    private:
    def self.pass_message(fxrate)
      "Exchange rate from #{fxrate['base']['key']}(#{fxrate['base']['rate']}) to #{fxrate['target']['key']}(#{fxrate['target']['rate']}) on #{fxrate['date']}: #{fxrate['rate']}"
    end
    def self.fail_message(fxrate)
    end
  end
end
