require_relative 'invoice_input'
require_relative './data/app_constant'
require_relative './invoice_file'
require_relative './invoice_table'
require_relative './invoice'
require 'tty-table'
require 'tty-prompt'

module MainInput
  def invoice_inputs
    main_invoice = InvoiceInterface.new
    invoice_data_view = InvoiceDataView.new
    invoice_struct = Invoice.new

    main_invoice.invoice_date_f
    main_invoice.invoice_odometer_f
    main_invoice.invoice_paid_f
    main_invoice.invoice_fuel_price_f
    main_invoice.invoice_fuel_qty_f
    main_invoice.invoice_fuel_type_f
    main_invoice.invoice_fuel_brand_f
    main_invoice.invoice_location_f

    # list all input for confirmation.
    not_confirm = true

    while not_confirm
      system('clear')
      invoice_struct.purchase_date = main_invoice.invoice_date.strftime('%d-%m-%Y')
      invoice_struct.odometer = main_invoice.invoice_odometer.distance
      invoice_struct.paid = main_invoice.invoice_paid.amount
      invoice_struct.price =  main_invoice.invoice_fuel_price.fuel_price
      invoice_struct.fuel_qty = main_invoice.invoice_fuel_qty.qty
      invoice_struct.fuel_type = main_invoice.invoice_fuel_type
      invoice_struct.fuel_brand = main_invoice.invoice_fuel_brand
      invoice_struct.location = main_invoice.invoice_location

      puts ''
      invoice_data_view.invoice = invoice_struct
      invoice_data_view.viewdata

      # table_body = []

      # # heading
      # table_heading = []
      # table_heading << 'Attribute'.colorize(:blue)
      # table_heading << 'Data'.colorize(:blue)

      # # Invoice date
      # table_line = []
      # table_line << 'Date'
      # table_line << main_invoice.invoice_date.strftime('%d-%m-%Y')
      # table_body << table_line
      # # Odometer
      # table_line = []
      # table_line << 'Odometer(km)'.colorize(:blue)
      # table_line << main_invoice.invoice_odometer.distance.to_s.colorize(:blue)
      # table_body << table_line
      # # Paid
      # table_line = []
      # table_line << 'Paid($)'
      # table_line << main_invoice.invoice_paid.amount
      # table_body << table_line
      # # Fule Price
      # table_line = []
      # table_line << 'Fuel Price($/L)'.colorize(:blue)
      # table_line << main_invoice.invoice_fuel_price.fuel_price.to_s.colorize(:blue)
      # table_body << table_line
      # # Fuel Qty
      # table_line = []
      # table_line << 'Fuel Quantity(L)'
      # table_line << main_invoice.invoice_fuel_qty.qty
      # table_body << table_line
      # # Fuel Type
      # table_line = []
      # table_line << 'Fuel Type'.colorize(:blue)
      # table_line << main_invoice.invoice_fuel_type.to_s.colorize(:blue)
      # table_body << table_line
      # # Fuel Brand
      # table_line = []
      # table_line << 'Fuel Brand'
      # table_line << main_invoice.invoice_fuel_brand
      # table_body << table_line
      # # Location
      # table_line = []
      # table_line << 'Location'.colorize(:blue)
      # table_line << main_invoice.invoice_location.to_s.colorize(:blue)
      # table_body << table_line
      # # assemble table
      # table = TTY::Table.new(table_heading, table_body)
      # renderer = TTY::Table::Renderer::Unicode.new(table)
      # puts renderer.render

      # confirm data
      confirm_prompt = TTY::Prompt.new
      ans_confirm = confirm_prompt.yes?('Are all the above data correct?')

      if ans_confirm
        not_confirm = false
      else
        modify_prompt = TTY::Prompt.new

        choices = ['Date', 'Odometer', 'Paid', 'Fuel Price', 'Fuel Quantity', 'Fuel Type', 'Fuel Brand', 'Location',
                   'Cancel']
        ans_modify = modify_prompt.enum_select('Select an editor?', choices)

        case ans_modify
        when 'Date'
          main_invoice.invoice_date_f
        when 'Odometer'
          main_invoice.invoice_odometer_f
        when 'Paid'
          main_invoice.invoice_paid_f
        when 'Fuel Price'
          main_invoice.invoice_fuel_price_f
        when 'Fuel Quantity'
          main_invoice.invoice_fuel_qty_f
        when 'Fuel Type'
          main_invoice.invoice_fuel_type_f
        when 'Fuel Brand'
          main_invoice.invoice_fuel_brand_f
        when 'Location'
          main_invoice.invoice_location_f
        when 'Cancel'
          not_confirm = true
        end
      end

      # append to invoice file
      new_invoice = Invoice.new
      # Invoice date
      new_invoice.purchase_date = main_invoice.invoice_date
      # Odometer
      new_invoice.odometer = main_invoice.invoice_odometer.distance
      # Paid

      new_invoice.paid = main_invoice.invoice_paid.amount
      # Fule Price

      new_invoice.price = main_invoice.invoice_fuel_price.fuel_price
      # Fuel Qty
      new_invoice.fuel_qty = main_invoice.invoice_fuel_qty.qty

      # Fuel Type

      new_invoice.fuel_type = main_invoice.invoice_fuel_type
      table_body << table_line
      # Fuel Brand

      new_invoice.fuel_brand = main_invoice.invoice_fuel_brand

      # Location

      new_invoice.location = main_invoice.invoice_location
      # *********************************
      # file

      file_name = "./data/#{FuelTrackFile::INVOICEDATA}"
      invoice_file = InvoiceFile.new(file_name)
      invoice_file_array = invoice_file.read_invoice
      invoice_file_array << new_invoice
      invoice_file.store = invoice_file_array

    end
  end
end
