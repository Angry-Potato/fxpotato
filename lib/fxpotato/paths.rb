module FxPotato
  DATA_FILE = 'rates.xml'
  DEFAULT_SOURCE_URL = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'

  class Paths
    def self.data_directory(in_rails = false, env = ENV)
      return env["FXPOTATO_DATA_DIR"] unless env["FXPOTATO_DATA_DIR"].nil?
      in_rails ? Rails.root.join("data") : File.join(File.expand_path(File.dirname(__FILE__) + "/../../"), "data")
    end

    def self.data_source_url(env = ENV)
      return env["FXPOTATO_DATA_SOURCE_URL"] unless env["FXPOTATO_DATA_SOURCE_URL"].nil?
      DEFAULT_SOURCE_URL
    end
  end
end
