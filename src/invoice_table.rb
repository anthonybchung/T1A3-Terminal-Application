
# accepts struct invoice unit for display
require 'colorize'
class InvoiceDataView
attr_accessor :invoice

def viewdata
    @table_header = ['Attribute'.colorize(:blue),'Data'.colorize(:blue)]

    @table_body = []

    #Invoice date
    @table_line = []
    @table_line << 'Date'
    @table_line << @invoice.purchase_date
    @table_body << @table_line

    #Odometer
    @table_line = []
    @table_line << 'Odometer(km)'.colorize(:blue)
    @table_line << @invoice.odometer.to_s.colorize(:blue)
    @table_body << @table_line

    #Paid
    @table_line =[]
    @table_line << 'Paid($)'
    @table_line << @invoice.paid
    @table_body << @table_line

    #Fuel Price
    @table_line =[]
    @table_line << 'Fuel Price($/L)'.colorize(:blue)
    @table_line << @invoice.price.to_s.colorize(:blue)
    @table_body << @table_line

    #Fuel Qty
    @table_line=[]
    @table_line<< 'Fuel Qty(l)'
    @table_line << @invoice.fuel_qty
    @table_body << @table_line

    #Fuel Type
    @table_line=[]
    @table_line << 'Fuel Type'.colorize(:blue)
    @table_line << @invoice.fuel_type.colorize(:blue)
    @table_body << @table_line

    #Fuel Brand
    @table_line = []
    @table_line << 'Fuel Brand'
    @table_line << @invoice.fuel_brand
    @table_body << @table_line

    #Location
    @table_line = []
    @table_line << 'Location'.colorize(:blue)
    @table_line << @invoice.location.colorize(:blue)
    @table_body << @table_line

    @table = TTY::Table.new(@table_header, @table_body)
      renderer = TTY::Table::Renderer::Unicode.new(@table)
      puts renderer.render

end

end