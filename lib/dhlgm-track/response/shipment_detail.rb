module DHLGM::Response
  class ShipmentDetail
    attr_accessor :tracking_number, 
                  :delivery_confirm, 
                  :customer_confirm, 
                  :address1, 
                  :address2, 
                  :city, 
                  :state, 
                  :zip, 
                  :weight, 
                  :shipped

    def initialize(init)
      init.each_pair do |key, val|
        instance_variable_set('@' + key.to_s, val)
      end
    end
    
  end
end