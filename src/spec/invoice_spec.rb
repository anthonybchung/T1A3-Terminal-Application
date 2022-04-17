# frozen_string_literal: true

require_relative '../invoice'

RSpec.describe 'Invoice' do
  it 'create a new Invoice object' do
    invoice = Invoice.new
    expect(invoice).to be_kind_of(Invoice)
  end
end

RSpec.describe 'InvoiceFile: Create new file' do
  it 'create a new file InvoiceFile object' do
    invoice_file = InvoiceFile.new
    expect(invoice_file).to be_kind_of(InvoiceFile)
  end

  it 'create a JSON file' do
    invoice_file = InvoiceFile.new
    file_name = '../invoice.json'
    invoice_file.create = file_name
    expect(File.file?(file_name)).to be true
  end

  it 'raise error if file does not have extension JSON' do
    invoice_file = InvoiceFile.new
    file_name = '../invoice'
    expect { invoice_file.create = file_name }.to raise_error(RuntimeError)
  end

  it 'raise error if file already exist' do
  invoice_file = InvoiceFile.new
  file_name = '../invoice.json'
  expect {invoice_file.create = file_name}.to raise_error(RuntimeError)
  end
end
