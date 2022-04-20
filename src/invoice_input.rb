# frozen_string_literal: true

require 'date'
require_relative 'odometer'
require_relative './invoice'
require_relative './paid'
require_relative './price'
require_relative './fuel_quantity'
require_relative './user_selection'
require_relative './data/app_constant.rb'
require 'colorize'
require 'colorized_string'
require 'tty-prompt'

begin
  puts 'Enter invoice date (dd-mm-yyyy):'.colorize(:yellow)
  answer_date = gets.chomp
  invoice_date = Date.parse(answer_date)
rescue StandardError
  puts 'make sure your date is in correct format.'.colorize(:red)
  retry
end

begin
  puts 'Enter odometer distance (must be an integer):'.colorize(:yellow)
  answer_odometer = gets.chomp
  invoice_odometer = Odometer.new
  invoice_odometer.distance = answer_odometer
rescue StandardError
  puts 'make sure your value is an integer'.colorize(:red)
  retry
end

begin
  puts 'Enter Paid Price (xx.xx):'.colorize(:yellow)
  answer_paid = gets.chomp
  invoice_paid = Paid.new
  invoice_paid.amount = answer_paid
rescue StandardError
  puts 'Data must be a number with 2 decimals'.colorize(:red)
  retry
end

begin
  puts 'Enter Fuel price per Litre (xxx.x):'.colorize(:yellow)
  answer_fuel_price = gets.chomp
  invoice_fuel_price = Price.new
  invoice_fuel_price.price = answer_fuel_price
rescue StandardError
  puts 'Data must be a number with 1 decimal'.colorize(:red)
  retry
end

begin
  puts 'Enter Fuel Quantity (xxx.xx)'.colorize(:yellow)
  answer_fuel_qty = gets.chomp
  invoice_fuel_qty = FuelQuantity.new
  invoice_fuel_qty.qty = answer_fuel_qty
rescue StandardError
  puts 'Data must be a number with 2 decimal (xxx.xx)'.colorize(:red)
  retry
end


fuel_type = UserSelection.new
fuel_type.file_name = "./data/#{FuelTrackFile::FUELTYPE}"
invoice_fuel_type= fuel_type.view(FuelTrackFile::FUELTYPE)

fuel_brand = UserSelection.new
fuel_brand.file_name = "./data/#{FuelTrackFile::FUELBRAND}"
invoice_fuel_brand = fuel_brand.view(FuelTrackFile::FUELBRAND)

fuel_location = UserSelection.new
fuel_location.file_name = "./data/#{FuelTrackFile::LOCATION}"
invoice_location = fuel_location.view(FuelTrackFile::LOCATION)

puts "invoice date: #{invoice_date}"
puts "odometer: #{invoice_odometer.distance}"
puts "Paid price: #{invoice_paid.amount}"
puts "Fuel price: #{invoice_fuel_price.fuel_price}"
puts "Fuel qty: #{invoice_fuel_qty.qty}"
puts "Fuel Type: #{invoice_fuel_type}"
puts "Fuel Brand:#{invoice_fuel_brand}"
puts "Location: #{invoice_location}"