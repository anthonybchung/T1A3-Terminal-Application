# accepts struct invoice unit for display
require 'colorize'
require_relative './invoice'
class InvoiceDataView
  attr_accessor :invoice

  def viewdata
    @table_header = ['Attribute'.colorize(:blue), 'Data'.colorize(:blue)]

    @table_body = []

    # Invoice date
    @table_line = []
    @table_line << 'Date'
    @table_line << @invoice.purchase_date
    @table_body << @table_line

    # Odometer
    @table_line = []
    @table_line << 'Odometer(km)'.colorize(:blue)
    @table_line << @invoice.odometer.to_s.colorize(:blue)
    @table_body << @table_line

    # Paid
    @table_line = []
    @table_line << 'Paid($)'
    @table_line << @invoice.paid
    @table_body << @table_line

    # Fuel Price
    @table_line = []
    @table_line << 'Fuel Price($/L)'.colorize(:blue)
    @table_line << @invoice.price.to_s.colorize(:blue)
    @table_body << @table_line

    # Fuel Qty
    @table_line = []
    @table_line << 'Fuel Qty(l)'
    @table_line << @invoice.fuel_qty
    @table_body << @table_line

    # Fuel Type
    @table_line = []
    @table_line << 'Fuel Type'.colorize(:blue)
    @table_line << @invoice.fuel_type.colorize(:blue)
    @table_body << @table_line

    # Fuel Brand
    @table_line = []
    @table_line << 'Fuel Brand'
    @table_line << @invoice.fuel_brand
    @table_body << @table_line

    # Location
    @table_line = []
    @table_line << 'Location'.colorize(:blue)
    @table_line << @invoice.location.colorize(:blue)
    @table_body << @table_line

    @table = TTY::Table.new(@table_header, @table_body)
    renderer = TTY::Table::Renderer::Unicode.new(@table)
    puts renderer.render
  end
end

# accept an array of Struct Invoice
class InvoiceListView
  attr_accessor :invoice_list

  def viewdata
    @table_header = ['Index','Date(yyyy-mm-dd)', 'Odometer', 'Paid Price($)', 'Fuel Price($/litre)', 'Fuel Qty(litre)', 'Fuel Type',
                     'Fuel Brand', 'Location']

    @table_body = []
    @alternate_color = true
    line_index = 1

    @invoice_list.each do |item|
      @table_line = []
      if @alternate
        @table_line << line_index.to_s
        @table_line << item.purchase_date.to_s
        @table_line << item.odometer.to_s
        @table_line << item.paid.to_s
        @table_line << item.price.to_s
        @table_line << item.fuel_qty
        @table_line << item.fuel_type
        @table_line << item.fuel_brand
        @table_line << item.location
        @alternate = false
      else
        @table_line << line_index.to_s.colorize(:blue)
        @table_line << item.purchase_date.to_s.colorize(:blue)
        @table_line << item.odometer.to_s.colorize(:blue)
        @table_line << item.paid.to_s.colorize(:blue)
        @table_line << item.price.to_s.colorize(:blue)
        @table_line << item.fuel_qty.colorize(:blue)
        @table_line << item.fuel_type.colorize(:blue)
        @table_line << item.fuel_brand.colorize(:blue)
        @table_line << item.location.colorize(:blue)
        @alternate = true
      end
      @table_body << @table_line
      line_index +=1
    end
    table = TTY::Table.new(@table_header, @table_body)
    puts table.render :unicode
    puts ''
    puts 'History of all the invoices'.colorize(:yellow)
    puts ''
  end
end
