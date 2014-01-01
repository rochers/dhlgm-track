module DHLGM::Response
  class TrackDetail
    attr_accessor :code, 
                  :date, 
                  :time, 
                  :city, 
                  :state, 
                  :description, 
                  :postalcode, 
                  :country

    def initialize(init)
      init.each_pair do |key, val|
        instance_variable_set('@' + key.to_s, val)
      end
    end

  end
end