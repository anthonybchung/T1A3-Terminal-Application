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

main_loop = true
# choose input,retrive, analyse or predict.
while main_loop
  system('clear')
  choose_main_prompt = TTY::Prompt.new
  ans_main = choose_main_prompt.select('Select an option',
                                       ['Input New Invoice', 'Retrieve List of Invoices', 'Analyse Data', 'Exit'])
  case ans_main
  when 'Input New Invoice'

    MainInput.invoice_inputs
  when 'Retrieve List of Invoices'
    system('clear')
    MainRetrieve.retrieve_invoice
  when 'Analyse Data'
    MainAnalyse.analyse
  when 'Exit'
    main_loop = false
  end
end
