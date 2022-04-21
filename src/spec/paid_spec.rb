# frozen_string_literal: true

require_relative '../paid'

RSpec.describe 'Paid price/amount' do
  it 'create a new Paid object' do
    paid = Paid.new
    expect(paid).to be_kind_of(Paid)
  end

  it 'fuel price takes in a value' do
    paid = Paid.new
    paid.amount = 55.98
    expect(paid.amount).to eq(55.98)
  end

  it 'raise an error if not in ddd.dd format' do
    paid = Paid.new
    expect { paid.amount = 58.222 }.to raise_error(RuntimeError)
  end

  it 'raise an error if not in digits' do
    paid = Paid.new
    expect { paid.amount = 'a44.44' }.to raise_error(RuntimeError)
  end
end
