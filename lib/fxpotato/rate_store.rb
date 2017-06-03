require 'nokogiri'

module FxPotato
  class RateStore
    def initialize(xml_data)
      @data = Nokogiri::XML(xml_data)
      @data.remove_namespaces!
    end

    def get(date, currency)
      query = "//Cube[@time=\'#{date.to_s}\']//Cube[@currency=\'#{currency}\']"
      @data.at_xpath(query)["rate"].to_f
    end
  end
end
