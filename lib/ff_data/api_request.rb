require 'httparty'
require './initializer'

module API
  module Request
    include HTTParty
    def base_url
      "https://api.fantasydata.net/nfl/v2"
    end

    def headers
      {'Ocp-Apim-Subscription-Key' => FantasyData.api_key}
    end

    def build_url(service, extras = [])
      [base_url, "json", service, extras].join("/").gsub(/\/$/, '')
    end

    def request_service(service, extras = [])
      url = build_url(service, extras)
      HTTParty.get(url, {headers: headers})
    end
  end
end