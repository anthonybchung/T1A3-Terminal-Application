require_relative 'invoice_input'
require_relative './data/app_constant'
require_relative './invoice_file'
require_relative './main_input'
require_relative './main_retrieve'
require_relative './main_analyse'
require 'tty-table'
require 'tty-prompt'

include MainInput
include MainRetrieve
include MainAnalyse

# choose input,retrive, analyse or predict.
choose_main_prompt = TTY::Prompt.new
ans_main = choose_main_prompt.select('Select an option',
                                     ['Input New Invoice', 'Retrieve List of Invoices', 'Analyse Data', 'Plan Journey'])
case ans_main
when 'Input New Invoice'

  MainInput.invoice_inputs
when 'Retrieve List of Invoices'
  system('clear')
  MainRetrieve.retrieve_invoice
when 'Analyse Data'
  MainAnalyse.analyse
when 'Plan Journey'
  puts 'where are you going'
end
