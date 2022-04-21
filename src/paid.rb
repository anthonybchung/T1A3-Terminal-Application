# frozen_string_literal: true

# due to discount, the paid amount may be different to qty*fuel_price.
class Paid
  attr_reader :amount

  def initialize
    @amount
  end

  def amount=(value)
    value_str = value.to_s
    raise 'Input must have 2 decimal place' unless /\d+\.\d\d$/.match?value_str
    raise 'Input must all be in digits' if /[a-zA-Z]+/.match? value_str

    @amount = value
  end
end
