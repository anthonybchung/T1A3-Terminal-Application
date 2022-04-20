# frozen_string_literal: true

# Fuel price that can only accept the correct format.
class Price
  attr_reader :fuel_price

  def initialize
    @fuel_price
  end

  def price=(val)
    val_str = val.to_s
    raise 'Fuel price data format -> ddd.d' unless /\d+\.\d/.match?(val_str)
    raise 'Fuel price data must not have letter' if /[a-zA-Z]/.match?(val_str)

    @fuel_price = val
  end
end
