require 'nokogiri'

module FxPotato
  class XmlRepo
    def initialize(data)
      @data = Nokogiri::XML(data || local_data)
      @data.remove_namespaces!
    end

    def local_data
      source_file = File.join(DATA_DIRECTORY, DATA_FILE)
      File.open(source_file)
    end

    def find(date, currency)
      query = "//Cube[@time=\'#{date.to_s}\']//Cube[@currency=\'#{currency}\']"
      @data.at_xpath(query)["rate"].to_f
    end
  end
end
