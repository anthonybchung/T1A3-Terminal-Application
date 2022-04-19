# frozen_string_literal: true
require 'json'
Invoice = Struct.new(:purchase_date, :price, :odometer, :fuel_qty, :fuel_type, :fuel_brand, :location)

# Connect Invoice to File
# - Create File
# - Use file
# - Append to file (Create data)
# - Read file (Read data)
# - Update data (Update data)
# - Delete data (Delete data)
class InvoiceFile
  attr_reader :file_name

  def initialize(file_name = '')
    @file_name = file_name
  end

  def create=(value)
    value_str = value.to_s
    raise 'Error, file should contain extension JSON' unless /\w+\.json/.match? value_str
    raise 'Error, file already exist' if File.file?(value_str)

    @file_name = value
    File.new(@file_name, 'w+')
  end

  def use=(value)
    value_str = value.to_s
    raise 'Error, file should contain extension JSON' unless /\w+\.json/.match? value_str

    @file_name = value
  end

  def append=(value) 
      json = File.read(@file_name)
      secondArray = JSON.parse(json)
      secondArray << value
      File.open('../invoice.json', "w") do |f|
        f.write(JSON.pretty_generate(secondArray))
      end
    end
end
