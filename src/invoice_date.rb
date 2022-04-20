# frozen_string_literal: true

# check the input format of invoice date.
class InvoiceDate
    attr_reader :invoice_date

    def initialize
        @invoice_date
    end
    def date=(value)
        value_str = value.to_s
        raise 'Error: Input must be in dd/mm/yyyy format' unless /\d{2}\/\d{2}\/\d{4}/.match? value_str
        @invoice_date = value
    end
end