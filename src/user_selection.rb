# frozen_string_literal: true

require 'tty-prompt'
require 'colorized_string'
require 'colorize'
require_relative './data/app_constant'
# connect to files for user slection
class UserSelection
  attr_accessor :file_name
  attr_reader :data_array, :selected_option

  def store=(values)
    @data_array = values
    File.open(@file_name, 'w') do |f|
      values.each { |element| f.puts(element) }
    end
  end

  def read_data
    @data_array = File.read(@file_name).split
    @data_array
  end

  def view(file_str)
    file_name_str_no_json = file_str.gsub('.json', ' ')
    file_name_str = file_name_str_no_json.gsub('_', ' ')
    @alternative = 'Add option'

    
    prompt = TTY::Prompt.new
    main_loop = true
    while main_loop == true
        @data_array = File.read(@file_name).split
    @display_array = @data_array.clone << @alternative
      @selected_option = prompt.select("Select #{file_name_str} option".colorize(:yellow), @display_array)
      question_loop = true
      while question_loop
        if selected_option == @alternative
          puts "Enter new #{file_name_str}".colorize(:yellow)
          answer_new_option = STDIN.gets.chomp
          @data_array << answer_new_option
          File.open(@file_name, 'w') do |f|
            @data_array.each { |element| f.puts(element) }
            question_loop = false
          end
        else
          return @selected_option
        end
      end
    end
  end
end

