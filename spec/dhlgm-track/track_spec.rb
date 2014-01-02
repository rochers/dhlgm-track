require 'spec_helper'

describe DHLGM do
  
  it "tracks shipped packages" do

    dhl_tracking_xml = File.read("#{Dir.pwd}/spec/dhl_api_responses/shipment_shipped.xml")

    WebMock.stub_request(:get, "https://api.dhlglobalmail.com/api.cfm?pass=test_pass&trackingnumber=2043XXXXXX1513&uname=test_user").
            with(headers: {'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus'}).
            to_return(status: 200, body: dhl_tracking_xml)

    result = DHLGM::track('2043XXXXXX1513')

    expect(result).to   be_kind_of(DHLGM::Response::Tracking)
  end


  it "tracks shipped packages with two events" do

    dhl_tracking_xml = File.read("#{Dir.pwd}/spec/dhl_api_responses/shipment_shipped.xml")

    WebMock.stub_request(:get, "https://api.dhlglobalmail.com/api.cfm?pass=test_pass&trackingnumber=2043XXXXXX1513&uname=test_user").
            with(headers: {'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus'}).
            to_return(status: 200, body: dhl_tracking_xml)

    result = DHLGM::track('2043XXXXXX1513')

    expect(result.tracking_events.count).to       eq(2)
    expect(result.tracking_events.first).to       be_kind_of(DHLGM::Response::TrackDetail)
  end


end