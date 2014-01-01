module DHLGM::Response
  class Tracking
    require 'dhlgm-track/response/shipment_detail'
    require 'dhlgm-track/response/track_detail'
    
    attr_accessor :tracking_events, :shipment_detail

    def initialize(xml)
       @shipment_detail = parse_shipment_detail(xml.search("shipment"))
       @tracking_events = []
       xml.search("event").each do |event|
         @tracking_events << parse_tracking_detail(event)
       end
     end
     
     private
     
     def parse_shipment_detail(node)
      DHLGM::Response::ShipmentDetail.new(
        {
          tracking_number:    node.search('trackingnumber').text, 
          delivery_confirm:   node.search('deliveryconfirm').text, 
          customer_confirm:   node.search('customerconfirm').text,  
          address1:           node.search('address1').text,  
          address2:           node.search('address2').text,  
          city:               node.search('city').text,  
          state:              node.search('state').text,  
          zip:                node.search('zip').text,  
          weight:             node.search('weight').text,  
          shipped:            node.search('shipped').text
        }
      )
     end

     def parse_tracking_detail(node)
      DHLGM::Response::TrackDetail.new(
        {
         code:        node.search('code').text,
         date:        node.search('date').text,
         time:        node.search('time').text,
         city:        node.search('city').text,
         state:       node.search('state').text,
         description: node.search('description').text,
         postalcode:  node.search('postalcode').text,
         country:     node.search('country').text
        }
      )
     end

  end
end