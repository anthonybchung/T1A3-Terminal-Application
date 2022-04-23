require_relative './invoice_file'
require_relative './data/app_constant'
require 'colorize'
require 'tty-table'
require 'tty-prompt'

module MainAnalyse
  def analyse
    file_name = "./data/#{FuelTrackFile::INVOICEDATA}"
    # call file
    invoice_file = InvoiceFile.new(file_name)
    invoice_struct_array = invoice_file.read_invoice

    # create Invoice Table List
    invoice_list_table = InvoiceListView.new
    invoice_list_table.invoice_list = invoice_struct_array
    invoice_list_table.viewdata
    analyse_or_not_prompt = TTY::Prompt.new
    ans_analyse = analyse_or_not_prompt.yes?('Do you want to analyse data?')
    if ans_analyse
      # get initial initial index
      initial_end_number = invoice_struct_array.length - 1
      begin
        puts "Enter the starting index [1-#{initial_end_number}]".colorize(:yellow)
        initial_index = STDIN.gets.chomp
        if /\d+$/.match? initial_index
          initial_int = initial_index.to_i
          raise 'Index must be an integer within the range given' unless initial_int.between?(1, initial_end_number)
        elsif /[a-zA-Z]/.match? initial_index
          raise 'Index must be an integer within the range given'
        end
      rescue StandardError
        puts 'Index must be an integer within the range give'.colorize(:red)
        retry
      end

      # get final index
      begin
        puts "Enter the ending index [#{initial_int + 1}-#{invoice_struct_array.length}]".colorize(:yellow)
        final_index = STDIN.gets.chomp
        if /\d+$/.match? final_index
          final_int = final_index.to_i
          raise 'Index must be an integer within the range given' unless final_int.between?(1,
                                                                                            invoice_struct_array.length)
        elsif /[a-zA-Z]/.match? final_index
          raise 'Index must be an integer within the range given'
        end
      rescue StandardError
        puts 'Index must be an integer within the range give'.colorize(:red)
        retry
      end

      data_index_0 = initial_int - 1
      data_index_1 = final_int - 1
      analyse_array = invoice_struct_array[data_index_0..data_index_1]

      # Cost for the past week
      total_paid = 0
      total_distance = analyse_array[-1].odometer - analyse_array[0].odometer
      total_fuel_qty = 0

      # average cost per km
      # Cost spent or amount of fuel consumed during this period
      consume_array = analyse_array.drop(1)

      consume_array.each do |item|
        total_paid += item.paid.to_f
        total_fuel_qty += item.fuel_qty.to_f
      end

      # $/km
      money_per_km = total_paid / total_distance

      litre_per_km = total_fuel_qty / total_distance

      # distance travelled
      total_distance = analyse_array[-1].odometer.to_f - analyse_array[0].odometer.to_f

      # money spent per week.
      date_difference = Date.parse(analyse_array[-1].purchase_date).mjd - Date.parse(analyse_array[0].purchase_date).mjd
      cost_per_week = total_paid / date_difference.to_f * 7

      # km / week
      km_per_week = total_distance / date_difference.to_f * 7

      table_header = ['Description'.colorize(:blue), 'Result'.colorize(:blue)]
      table_body = []

      table_line = []
      table_line << 'Starting Date:'
      table_line << analyse_array[0].purchase_date
      table_body << table_line

      table_line = []
      table_line << 'End Date:'.colorize(:blue)
      table_line << analyse_array[-1].purchase_date.colorize(:blue)
      table_body << table_line

      table_line = []
      table_line << 'Money spent during this time'
      table_line << "$#{total_paid.round(2)}"
      table_body << table_line
      table_line = []
      table_line << 'Distance travelled during this time'.colorize(:blue)
      table_line << "#{total_distance}km".colorize(:blue)
      table_body << table_line

      table_line = []
      table_line << 'Cost per km'
      table_line << "$#{money_per_km.round(2)}/km"
      table_body << table_line

      table_line = []
      table_line << 'Litre per km'.colorize(:blue)
      table_line << "#{litre_per_km.round(2)}litre/km".colorize(:blue)
      table_body << table_line

      table_line = []
      table_line << 'Cost per week'
      table_line << "$#{cost_per_week.round(2)}/week"
      table_body << table_line

      table_line = []
      table_line << 'Distance per week'.colorize(:blue)
      table_line << "#{km_per_week.to_i}km/week".colorize(:blue)
      table_body << table_line

      table = TTY::Table.new(table_header, table_body)
      puts table.render :unicode
      continue_prompt = TTY::Prompt.new
      continue_prompt.keypress("Press any key to continue, resumes automatically in 3 minutes ...".colorize(:yellow), timeout: 180)
    end
  end
end
