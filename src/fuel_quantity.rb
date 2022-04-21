# frozen_string_literal: true

# Amount of fuel filled or used.
class FuelQuantity
  attr_reader :qty

  def initialize
    @qty = 0.0
  end

  def qty=(value)
    value_str = value.to_s
    raise 'Quantity must be a number with 2 decimal places' unless /\d+\.\d{2}$/.match? value_str
    raise 'Quantity must be a number' if /[a-zA-Z]/.match? value_str

    @qty = value
  end
end