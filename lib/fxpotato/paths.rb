module FxPotato
  class Paths
    def self.data_directory(in_rails = false)
      in_rails ? Rails.root.join("data") : File.join(File.expand_path(File.dirname(__FILE__) + "/../../"), "data")
    end
  end
  DATA_FILE = 'rates.xml'
  DATA_SOURCE_URL = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'
end
