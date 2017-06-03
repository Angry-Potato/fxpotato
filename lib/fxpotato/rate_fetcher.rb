require 'net/http'

module FxPotato
  class RateFetcher
    def self.fetch_new_rates(source_url, destination)
      uri = URI(source_url)

      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri

        http.request request do |response|
          open destination, 'w' do |io|
            response.read_body do |chunk|
              io.write chunk
            end
          end
        end
      end
    end
  end
end
