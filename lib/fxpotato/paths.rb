module FxPotato
  DATA_DIRECTORY = File.join(Gem.loaded_specs["fxpotato"] ? Gem.loaded_specs["fxpotato"].full_gem_path : File.expand_path(File.dirname(__FILE__) + "/../../"), "data")
  DATA_FILE = 'rates.xml'
  DATA_SOURCE_URL = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'
end
