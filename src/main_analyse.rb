require_relative './invoice_file'
require_relative './data/app_constant'
require 'colorize'
require 'tty-table'


module MainAnalyse
    
    def analyse
puts "hello from main anayal"
        #call file
        file_name = "./data/#{FuelTrackFile::INVOICEDATA}"
    invoice_file = InvoiceFile.new(file_name)
    invoice_file.read_invoice
    invoice_file.invoice_array_struct
    # Cost for the past week
        puts "For the past 10 fills you averaged "
    # average cost per km
        puts "For the past 10 fills your cost per km:"
        
    # average km per weeek

    # average km per L

    end
end