# frozen_string_literal: true
Invoice = Struct.new(:price,:odometer,:fuel_qty,:fuel_type,:fuel_brand,:location)

class InvoiceFile
    attr_reader :file_name

    def initialize(file_name='')
        @file_name = file_name
    end

    def create=(value)
        value_str = value.to_s
        raise 'Error, file should contain extension JSON' unless /\w+\.json/.match? value_str
        raise 'Error, file already exist' if File.file?(value_str)
        @file_name = value
        File.new(@file_name,"w+")
    end
end



