# frozen_string_literal: true

require_relative '../invoice'
require 'json'

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

 

  it 'raise error if file does not have extension JSON' do
    invoice_file = InvoiceFile.new
    file_name = '../invoice'
    expect { invoice_file.create = file_name }.to raise_error(RuntimeError)
  end

  it 'raise error if file already exist' do
    invoice_file = InvoiceFile.new
    file_name = '../invoice.json'
    expect { invoice_file.create = file_name }.to raise_error(RuntimeError)
  end
end

RSpec.describe 'Use file' do
  it 'enter file name to be used' do
    invoice_file = InvoiceFile.new
    file_name = '../invoice.json'
    invoice_file.use = file_name
    expect(invoice_file).to have_attributes(file_name: file_name)
  end

  it 'raise error if file does not have extension JSON' do
    invoice_file = InvoiceFile.new
    file_name = '../invoice'
    expect { invoice_file.use = file_name }.to raise_error(RuntimeError)
  end

end

RSpec.describe 'Append data' do 
  it 'append value to file' do
  invoice_file = InvoiceFile.new
  file_name = '../invoice.json'
  invoice_file.use=file_name
  invoice_file.append = {"purchase_date":"11-11-2222"}
  
  end
end