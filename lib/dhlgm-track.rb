require "dhlgm-track/client"
require "dhlgm-track/configuration"
require "dhlgm-track/version"

module DHLGM
  class << self
    attr_writer :configuration

    def client
      @client ||= Client.new
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def track(tracking_number)
      client.request(DHLGM::Request::Tracking.new(tracking_number))
    end

    alias_method :config, :configuration
  end
end
