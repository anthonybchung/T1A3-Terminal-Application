require_relative 'invoice_input'
require_relative './data/app_constant'
require_relative './invoice_file'
require_relative './main_input'
require_relative './main_retrieve'
require 'tty-table'
require 'tty-prompt'

include MainInput
include MainRetrieve

# choose input,retrive, analyse or predict.
choose_main_prompt = TTY::Prompt.new
ans_main = choose_main_prompt.select('Select an option',
                                     ['Input New Invoice', 'Retrieve List of Invoices', 'Analyse data', 'Plan Journey'])
case ans_main
when 'Input New Invoice'
  MainInput.invoice_inputs
when 'Retrieve List of Invoices'
    system("clear")
  MainRetrieve.retrieve_invoice
when 'Analyse Data'
  puts 'you want maths'
when 'Plan Journey'
  puts 'where are you going'
end
