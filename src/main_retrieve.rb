require_relative './invoice_file'
require_relative './data/app_constant'
require 'colorize'
require 'tty-table'
require 'tty-prompt'
require 'date'
require_relative './invoice_input'
require_relative './invoice_table'
require_relative './invoice_modify'


module MainRetrieve
  def retrieve_invoice

    file_name = "./data/#{FuelTrackFile::INVOICEDATA}"

    invoice_file = InvoiceFile.new(file_name)
    invoice_struct_array = invoice_file.read_invoice

    # create Invoice Table List
    invoice_list_table = InvoiceListView.new
    invoice_list_table.invoice_list = invoice_struct_array
    invoice_list_table.viewdata

    # Option to choose which data to be modified
    modify_or_not_prompt = TTY::Prompt.new
    ans_modify = modify_or_not_prompt.yes?('Do you want to modify an invoice?')
    if ans_modify
      begin
        puts "Enter an index number between 1 and #{invoice_struct_array.length} or 'C' to cancel".colorize(:yellow)
        ans_index = STDIN.gets.chomp
        puts ans_index
        if /\d+$/.match? ans_index
          ans_int = ans_index.to_i
          raise 'Enter valid option' unless ans_int.between?(1, invoice_struct_array.length)
        else
          ans_upcase = ans_index.upcase
          raise 'Enter valid option' unless /C/.match? ans_upcase
        end
      rescue StandardError
        puts 'Enter valid option'.colorize(:red)
        retry
      end

      # list data that needs to be modifed
      system('clear')
      if ans_upcase != 'C' then
      invoice_struct = invoice_struct_array[ans_int - 1] 
      invoice_modify = InvoiceModify.new(invoice_struct)
      invoice_modify.view
      invoice_struct_array[ans_int-1] = invoice_modify.invoice_struct
      invoice_file.store=invoice_struct_array

      end
    end
  end
end
