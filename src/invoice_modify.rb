
class InvoiceModify
    # Invoice struct
    attr_accessor :invoice_struct :invoice_interface

    #value = struct invoice
    def initialize(value)
        @invoice_struct = value
        @invoice_data_view = InvoiceDataView.new
        @invoice_interface = InvoiceInterface.new
        @invoice_interface.set_data = value
    end
    def view
           
        not_confirm = true

        while not_confirm
          system('clear')
          puts ''
          #display table
          invoice_data_view.invoice = @invoice_struct
          invoice_data_view.viewdata
    
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
            invoice_interface.invoice_date_f
            when 'Odometer'
              invoice_interface.invoice_odometer_f
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
        end
     
    end
end