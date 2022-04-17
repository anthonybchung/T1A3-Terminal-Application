
class Price
    attr_reader :fuel_price

    def initialize
        @fuel_price
    end

    def price=(val)
        val_str = val.to_s
        raise 'Fuel price data format -> ddd.d' unless /\d\d\d\.\d/.match?(val_str)
        @fuel_price = val
    end
end