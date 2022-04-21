require_relative './invoice_file'
require_relative './data/app_constant'
require 'colorize'
require 'tty-table'
require 'tty-prompt'
require 'date'

module MainRetrieve
  def retrieve_invoice
    file_name = "./data/#{FuelTrackFile::INVOICEDATA}"

    invoicefile = InvoiceFile.new(file_name)
    invoice_struct_array = invoicefile.read_invoice

    # table heading
    table_heading = ['index'.colorize(:blue)]
    FuelTrackFile::INVOICEATTRIBUTES.each do |item|
      table_heading << item.colorize(:blue)
    end

    # table body
    table_body = []
    alternate = true
    line_index = 1
    invoice_struct_array.each do |item|
      table_line = []
      if alternate
        table_line << line_index.to_s
        table_line << item.purchase_date
        table_line << item.odometer.to_s
        table_line << item.paid.to_s
        table_line << item.price.to_s
        table_line << item.fuel_qty
        table_line << item.fuel_type
        table_line << item.fuel_brand
        table_line << item.location
        alternate = false
      else
        table_line << line_index.to_s.colorize(:blue)
        table_line << item.purchase_date.colorize(:blue)
        table_line << item.odometer.to_s.colorize(:blue)
        table_line << item.paid.to_s.colorize(:blue)
        table_line << item.price.to_s.colorize(:blue)
        table_line << item.fuel_qty.to_s.colorize(:blue)
        table_line << item.fuel_type.colorize(:blue)
        table_line << item.fuel_brand.colorize(:blue)
        table_line << item.location.colorize(:blue)
        alternate = true
      end
      table_body << table_line
      line_index += 1
    end
    table = TTY::Table.new(table_heading, table_body)
    puts table.render :unicode
    puts ''
    puts 'History of all the invoices'.colorize(:yellow)
    puts ''
    modify_prompt = TTY::Prompt.new
    ans_modify=modify_prompt.yes?("Do you what to modify an invoice?".colorize(:yellow))

    if ans_modify
        system('clear')
        puts table.render :unicode
        puts' '
        begin
        no_of_invoice = invoice_struct_array.length
        puts "Enter index number [1-#{no_of_invoice}]"
        ans_index_number = gets.chomp
        raise 'Error must be integer [0-#{no_of_invoice}]' if /[a-zA-Z]/.match? ans_index_number
        ans_int = ans_index_number.to_i
        raise 'Must be a valid number [0-#{no_of_invoice}]' unless ans_int.between?(0,no_of_invoice)
        rescue 
            puts "Enter valid number"
            retry
        end
    else

    end
  end
end
