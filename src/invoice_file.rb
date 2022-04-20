# frozen_string_literal: true

require 'json'
require_relative './invoice'
require_relative './data/app_constant'

class InvoiceFile
  attr_accessor :file_name
  attr_reader :invoice_array_hash, :invoice_array_struct

  def initialize(val)
    @file_name = val
  end

  def read_invoice
    file = File.read(@file_name)
    json_array = JSON.parse(file, symbolize_names: true)
    @invoice_array_struct = []
    json_array.each do |item|
      invoice_struct = Invoice.new
      invoice_struct.purchase_date = item[:purchase_date]
      invoice_struct.price = item[:price]
      invoice_struct.paid = item[:paid]
      invoice_struct.odometer = item[:odometer]
      invoice_struct.fuel_qty = item[:fuel_qty]
      invoice_struct.fuel_type = item[:fuel_type]
      invoice_struct.fuel_brand = item[:fuel_brand]
      invoice_struct.location = item[:location]
      @invoice_array_struct << invoice_struct
    end
    @invoice_array_struct
  end

  def store=(values)
    @invoice_array_hash = []
    values.each do |item|
      @invoice_array_hash << item.to_h
    end
    File.write(@file_name, JSON.dump(@invoice_array_hash))
  end

  def reset_invoice
    @invoice_array_hash =[]
    File.write(@file_name,JSON.dump(@invoice_array_hash))
  end
end
