require_relative 'invoice_input'
require_relative './data/app_constant'
require_relative './invoice_file'
require_relative './main_input'
require_relative './main_retrieve'
require_relative './main_analyse'

require 'tty-table'
require 'tty-prompt'
require 'tty-markdown'
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
    help_loop = true
    while help_loop
      parsed = TTY::Markdown.parse_file('./data/help.md')
      puts parsed
      puts 'Press X to exit'
      ans_exit = STDIN.gets.chomp
      exit if %w[X x].include?(ans_exit)
    end
  end
else
  FileUtils.cp('./data/fuel_brand_actual.json', './data/fuel_brand.json')
  FileUtils.cp('./data/fuel_type_actual.json', './data/fuel_type.json')
  FileUtils.cp('./data/invoice_actual.json', './data/invoice.json')
  FileUtils.cp('./data/location_actual.json', './data/location.json')
end

file_name = "./data/#{FuelTrackFile::INVOICEDATA}"

main_loop = true
# choose input,retrive, analyse or predict.
while main_loop
  file = File.read(file_name)
  system('clear')

  choose_main_prompt = TTY::Prompt.new
  main_option = []
  main_option << 'Input New Invoice'
  main_option << 'Retrieve List of Invoices' if file.size > 2
  main_option << 'Analyse Data' if file.size > 2
  main_option << 'Delete all invoice' if file.size > 2
  main_option << 'Exit'
  ans_main = choose_main_prompt.select('Select an option',
                                       main_option)

  case ans_main
  when 'Input New Invoice'
    system('clear')
    MainInput.invoice_inputs
  when 'Retrieve List of Invoices'
    system('clear')
    MainRetrieve.retrieve_invoice
  when 'Analyse Data'
    MainAnalyse.analyse

  when 'Delete all invoice'
    invoice_file = InvoiceFile.new(file_name)
    invoice_file.reset_invoice
    main_option -= ['Retrieve List of Invoices']
    main_option -= ['Analyse Data']
    main_option -= ['Delete all invoice']
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
