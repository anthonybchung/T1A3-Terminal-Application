# frozen_string_literal: true

require_relative '../price'

RSpec.describe 'Price' do
  it 'create a new Price object' do
    price = Price.new
    expect(price).to be_kind_of(Price)
  end

  it 'fuel price takes in a value' do
    price = Price.new
    price.price = 159.9
    expect(price.fuel_price).to eq(159.9)
  end

  it 'raise an error if not in ddd.d format' do
    price = Price.new
    expect { price.price = 142 }.to raise_error(RuntimeError)
  end

  it 'raise an error if there is a letter' do
    price = Price.new
    expect { price.price = 'e12.22' }.to raise_error(RuntimeError)
  end
end
