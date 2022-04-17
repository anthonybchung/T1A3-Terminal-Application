# frozen_string_literal: true

require_relative '../fuel_quantity'

RSpec.describe 'Fuel Quantity' do
  it 'create a new Fuel Quantity object' do
    fuel_qty = FuelQuantity.new
    expect(fuel_qty).to be_kind_of(FuelQuantity)
  end

  it 'enter a data' do
    fuel_qty = FuelQuantity.new
    fuel_qty.qty = 145.88
    expect(fuel_qty.qty).to eq(145.88)
  end

  it 'raise error if fuel quantity does not have 2 decimals' do
    fuel_qty = FuelQuantity.new
    expect { fuel_qty.qty = '191.2' }.to raise_error(RuntimeError)
  end

  it 'raise an error if fuel quantity is not a number' do
    fuel_qty = FuelQuantity.new
    expect { fuel_qty.qty = 'a22.33' }.to raise_error(RuntimeError)
  end
end
