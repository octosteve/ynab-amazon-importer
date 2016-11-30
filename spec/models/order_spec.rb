require_relative '../../config/environment'
require 'spec_helper'

describe Order do
  let(:order_id) { '002-23123-1232' }
  let(:order) { Order.new(id: order_id) }

  it 'has an id' do
    expect(order.id).to eq(order_id)
  end

  context 'when fulfillments are added' do
    let(:fulfillment_one) { Fulfillment.new(order_id: order_id, shipment_date: Date.parse('11-01-2016'), total_price: Money.new(1234))}
    let(:fulfillment_two) { Fulfillment.new(order_id: order_id, shipment_date: Date.parse('11-04-2016'), total_price: Money.new(4321))}

    before do
      order.fulfillments << fulfillment_one
      order.fulfillments << fulfillment_two
    end

    it 'has many fulfillments' do
      expect(order.fulfillments).to match_array([fulfillment_one, fulfillment_two])
    end
  end

end
