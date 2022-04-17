class Odometer
    attr_reader :distance

    def initiallize
        @distance = 0
    end

    def distance=(value)
        value_str = value.to_s
        raise 'Error must be an integer' if /[a-zA-Z.]/.match? value_str
        @distance = value
    end
end