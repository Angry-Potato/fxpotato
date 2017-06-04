module FxPotato
  class FxRate
    attr_reader :base_key, :base_rate, :target_key, :target_rate, :date, :rate
    def initialize(base_key, base_rate, target_key, target_rate, date, rate)
      @base_key, @base_rate, @target_key, @target_rate, @date, @rate = base_key, base_rate, target_key, target_rate, date, rate
    end

    def serialize
      {
        'date' => @date,
        'base' => {
          'key' => @base_key,
          'rate' => @base_rate
        },
        'target' => {
          'key' => @target_key,
          'rate' => @target_rate
        },
        'rate' => @rate
      }
    end
  end
end
