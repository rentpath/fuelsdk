require 'spec_helper'

describe FuelSDK::Soap do
  let(:client) { FuelSDK::Client.new }

  describe '#format_cud_properties_for_dataextension' do
    it 'leaves CustomerKey alone an puts other attributes in name value pairs under Properies' do
      properties = [{'CustomerKey' => 'Orders', 'total' => 1}]
      expect(client.format_dataextension_cud_properties(properties, :create)).to eq([{
        'CustomerKey' => 'Orders',
         'Properties' => {'Property' => [{'Name' => 'total', 'Value' => 1}]}
       }])
    end
  end
end
