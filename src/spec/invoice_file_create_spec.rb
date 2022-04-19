# frozen_string_literal: true

require_relative '../invoice'
require 'json'

RSpec.describe 'Invoice create file' do
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
end
