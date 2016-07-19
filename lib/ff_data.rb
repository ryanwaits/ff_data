require "ff_data/version"
require './ff_data/initializer'

class FantasyData
    extend API::Request

    @@api_key = nil

    # set api key
    def self.api_key
        @@api_key ||= ENV['FANTASY_DATA_KEY']
    end
    
end
