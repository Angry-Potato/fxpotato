module FxPotato
  DATA_DIRECTORY = defined?(Rails) ? File.join(Rails.root, "data") : File.join(File.expand_path(File.dirname(__FILE__) + "/../../"), "data")
  DATA_FILE = 'rates.xml'
  DATA_SOURCE_URL = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'
end
