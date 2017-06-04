require 'nokogiri'

module FxPotato
  class XmlRepo
    def initialize(data = nil)
      @data = Nokogiri::XML(data || local_data)
      @data.remove_namespaces!
    end

    def local_data
      data_dir = Paths.data_directory(defined?(Rails))
      FxPotato::fetch_new_rates if !File.exists? File.join(data_dir, DATA_FILE)
      source_file = File.join(data_dir, DATA_FILE)
      File.open(source_file)
    end

    def find(date, currency)
      query = "//Cube[@time=\'#{date.to_s}\']//Cube[@currency=\'#{currency}\']"
      result = @data.at_xpath(query)
      result ? result["rate"].to_f : nil
    end
  end
end
