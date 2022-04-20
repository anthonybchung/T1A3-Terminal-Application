# frozen_string_literal: true

require_relative '../invoice_file'
require_relative '../invoice'
require_relative '../data/app_constant'

RSpec.describe 'Send data to Invoice File' do
  it 'create a new Invoice File object' do
    file_name = "../data/#{FuelTrackFile::INVOICEDATA}"
    invoice_file = InvoiceFile.new(file_name)
    expect(invoice_file).to be_kind_of(InvoiceFile)
  end

  it 'store data onto file' do
    file_name = "../data/#{FuelTrackFile::INVOICEDATA}"
    invoice_file = InvoiceFile.new(file_name)
    invoice_curr = Invoice.new('12122022', 1.59, 44.32, 123_223, 55.33, 'E-10', 'AMPOL', 'Kingsford')
    invoice_array = []
    invoice_array << invoice_curr
    invoice_array << invoice_curr
    invoice_file.store = invoice_array
    expect(invoice_file.read_invoice).to eq(invoice_array)
  end
end
