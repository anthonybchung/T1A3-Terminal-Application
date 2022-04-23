require_relative 'invoice_input'
require_relative './data/app_constant'
require_relative './invoice_file'
require_relative './main_input'
require_relative './main_retrieve'
require_relative './main_analyse'

require 'tty-table'
require 'tty-prompt'
require 'fileutils'

include MainInput
include MainRetrieve
include MainAnalyse
include FuelTrackFile

if !ARGV.empty?
  fuel_track_version = ARGV[0]

  case fuel_track_version
  when 'demo'
    FileUtils.cp('./data/fuel_brand_demo.json', './data/fuel_brand.json')
    FileUtils.cp('./data/fuel_type_demo.json', './data/fuel_type.json')
    FileUtils.cp('./data/invoice_demo.json', './data/invoice.json')
    FileUtils.cp('./data/location_demo.json', './data/location.json')
  when 'help'
  end
else
  FileUtils.cp('./data/fuel_brand_actual.json', './data/fuel_brand.json')
  FileUtils.cp('./data/fuel_type_actual.json', './data/fuel_type.json')
  FileUtils.cp('./data/invoice_actual.json', './data/invoice.json')
  FileUtils.cp('./data/location_actual.json', './data/location.json')
end
main_loop = true
# choose input,retrive, analyse or predict.
while main_loop
  system('clear')

  choose_main_prompt = TTY::Prompt.new
  ans_main = choose_main_prompt.select('Select an option',
                                       ['Input New Invoice', 'Retrieve List of Invoices', 'Analyse Data', 'Exit'])
  case ans_main
  when 'Input New Invoice'
    system('clear')
    MainInput.invoice_inputs
  when 'Retrieve List of Invoices'
    system('clear')
    MainRetrieve.retrieve_invoice
  when 'Analyse Data'
    MainAnalyse.analyse
  when 'Exit'
    if ARGV.empty?
      FileUtils.cp('./data/fuel_brand.json', './data/fuel_brand_actual.json')
      FileUtils.cp('./data/fuel_type.json', './data/fuel_type_actual.json')
      FileUtils.cp('./data/invoice.json', './data/invoice_actual.json')
      FileUtils.cp('./data/location.json', './data/location_actual.json')
    end
    main_loop = false
  end
end
