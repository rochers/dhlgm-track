module DHLGM::Request
  class Tracking

    attr_accessor :tracking_number
    
    def initialize(tracking_number)
      @tracking_number = tracking_number
    end

    def api_params
      {
        trackingnumber: tracking_number
      }
    end

    def response_handler(xml)
      DHLGM::Response::Tracking.new(xml)
    end
  
  end
end