require 'nokogiri'
require 'typhoeus'

require "dhlgm-track/errors"
require "dhlgm-track/request/tracking"
require "dhlgm-track/response/tracking"

module DHLGM
  class Client
    
    def request(request, &block)
      response = Typhoeus::Request.get(tracking_api_url, {
        timeout: DHLGM.config.timeout,
        params: {
          uname:  DHLGM.config.username,
          pass:   DHLGM.config.password,
        }.merge(request.api_params)
      })

      # Parse the request
      xml = Nokogiri::XML.parse(response.body)

      if (error = xml.search('error')).any?
        code = error.search('code').text
        description = error.search('description').text

        raise Error.for_code(code).new(code, description)
      end

      request.response_handler(xml)
    end

    private
    
    def tracking_api_url
      "https://api.dhlglobalmail.com/api.cfm"
    end

  end
end