# frozen_string_literal: true

require 'date'
require_relative 'odometer'
require_relative './invoice'
require_relative './paid'
require_relative './price'
require_relative './fuel_quantity'
require_relative './user_selection'
require_relative './data/app_constant'
require 'colorize'
require 'colorized_string'
require 'tty-prompt'

# group functions togeter
class InvoiceInterface
  attr_accessor :invoice_date, :invoice_odometer, :invoice_paid, :invoice_fuel_price, :invoice_fuel_qty,
                :invoice_fuel_type, :invoice_fuel_brand, :invoice_location, :invoice_struct

  # accept a struct Invoice
  def initialize
    @invoice_struct = Invoice.new
    @invoice_odometer = Odometer.new
    @invoice_paid = Paid.new
    @invoice_fuel_price = Price.new
    @invoice_fuel_qty = FuelQuantity.new
    
   
  end

  def set_data(value)
    @invoice_date = Date.parse(value.purchase_date)
    @invoice_odometer.distance = value.odometer
    @invoice_paid.amount = value.paid
    @invoice_fuel_price.price = value.price
    @invoice_fuel_qty.qty = value.fuel_qty
    @invoice_fuel_type = value.fuel_type
    @invoice_fuel_brand = value.fuel_brand
    @invoice_location = value.location

  end

  def invoice_date_f
    puts 'Enter invoice date (dd-mm-yyyy):'.colorize(:yellow)
    answer_date = gets.chomp
    @invoice_date = Date.parse(answer_date)
  rescue StandardError
    puts 'Make sure your date is in correct format.'.colorize(:red)
    retry
  end

  def invoice_odometer_f
    puts 'Enter odometer distance km(must be an integer):'.colorize(:yellow)
    answer_odometer = gets.chomp
   
    @invoice_odometer.distance = answer_odometer
  rescue StandardError
    puts 'make sure your value is an integer'.colorize(:red)
    retry
  end

  def invoice_paid_f
    puts 'Enter Paid Price $(xx.xx):'.colorize(:yellow)
    answer_paid = gets.chomp
    # @invoice_paid = Paid.new
    @invoice_paid.amount = answer_paid
  rescue StandardError
    puts 'Data must be a number with 2 decimals'.colorize(:red)
    retry
  end

  def invoice_fuel_price_f
    puts 'Enter Fuel price per Litre cent(xxx.x):'.colorize(:yellow)
    answer_fuel_price = gets.chomp
    # @invoice_fuel_price = Price.new
    @invoice_fuel_price.price = answer_fuel_price
  rescue StandardError
    puts 'Data must be a number with 1 decimal'.colorize(:red)
    retry
  end

  def invoice_fuel_qty_f
    puts 'Enter Fuel Quantity Litre(xxx.xx)'.colorize(:yellow)
    answer_fuel_qty = gets.chomp
    puts "answer_fuel_qty:#{answer_fuel_qty}"
    # @invoice_fuel_qty = FuelQuantity.new
    @invoice_fuel_qty.qty = answer_fuel_qty
  rescue StandardError
    puts 'Data must be a number with 2 decimal (xxx.xx)'.colorize(:red)
    retry
  end

  def invoice_fuel_type_f
    fuel_type = UserSelection.new
    fuel_type.file_name = "./data/#{FuelTrackFile::FUELTYPE}"
    @invoice_fuel_type = fuel_type.view(FuelTrackFile::FUELTYPE)
  end

  def invoice_fuel_brand_f
    fuel_brand = UserSelection.new
    fuel_brand.file_name = "./data/#{FuelTrackFile::FUELBRAND}"
    @invoice_fuel_brand = fuel_brand.view(FuelTrackFile::FUELBRAND)
  end

  def invoice_location_f
    fuel_location = UserSelection.new
    fuel_location.file_name = "./data/#{FuelTrackFile::LOCATION}"
    @invoice_location = fuel_location.view(FuelTrackFile::LOCATION)
  end

  def get_struct
    @invoice_struct.purchase_date = @invoice_date
    @invoice_struct.odometer = @invoice_odometer.distance
    @invoice_struct.paid = @invoice_paid.amount
    @invoice_struct.price = @invoice_fuel_price.fuel_price
    @invoice_struct.fuel_qty = @invoice_fuel_qty.qty
    @invoice_struct.fuel_type = @invoice_fuel_type
    @invoice_struct.fuel_brand = @invoice_fuel_brand
    @invoice_struct.location = @invoice_location
    @invoice_struct
  end
end
