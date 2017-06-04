module FxPotato
  class CLIFormatter
    def self.result(fxrate)
      fxrate && fxrate['rate'] ? pass_message(fxrate) : fail_message(fxrate)
    end

    private
    def self.pass_message(fxrate)
      "Exchange rate from #{key_and_rate(fxrate['base'])} to #{key_and_rate(fxrate['target'])} on #{fxrate['date']}: #{fxrate['rate']}"
    end

    def self.fail_message(fxrate)
      "Unable to calculate that exchange rate, here's why:\n#{inspect_rate_block(fxrate['base'], fxrate['date'])}\n#{inspect_rate_block(fxrate['target'], fxrate['date'])}"
    end

    def self.key_and_rate(rate_block)
      "#{rate_block['key']}(#{rate_block['rate']})"
    end

    def self.inspect_rate_block(rate_block, date)
      rate_block['rate'] ? "" : "\tUnable to find rate for #{rate_block['key']} on #{date}"
    end
  end
end
