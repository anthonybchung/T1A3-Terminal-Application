# frozen_string_literal: true

require_relative '../invoice_date'

RSpec.describe 'Invoice Date' do
  it 'create a new Invoice Date object' do
    invoice_date = InvoiceDate.new
    expect(invoice_date).to be_kind_of(InvoiceDate)
  end

  it 'should accept any object and store it' do
    invoice_date = InvoiceDate.new
    invoice_date.date = '12/12/2022'
    expect(invoice_date.invoice_date).to eq('12/12/2022')
  end

  it 'should raise an error if not in proper format dd/mm/yyyy' do
    invoice_date = InvoiceDate.new
    expect { invoice_date.date = '12-12-2022' }.to raise_error(RuntimeError)
  end

  it 'should raise an error if it contains letters' do
    invoice_date = InvoiceDate.new
    expect { invoice_date.date = 'a1/12/2022' }.to raise_error(RuntimeError)
  end
end
