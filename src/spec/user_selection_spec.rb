# frozen_string_literal: true

require_relative '../user_selection'
require_relative '../data/app_constant'

RSpec.describe 'User selection' do
  it 'create a new User Selection object' do
    user_selection = UserSelection.new
    expect(user_selection).to be_kind_of(UserSelection)
  end

  it 'store data to file' do
    user_selection = UserSelection.new
    file_name = "../data/#{FuelTrackFile::FUELBRAND}"
    user_selection.file_name = file_name
    data_array = %w[AMPOL BP Caltex]
    user_selection.store = data_array
    data_array2 = %w[it is working]
    user_selection.store = data_array2
    expect(user_selection.file_name).to eq(file_name)
  end

  it 'retrieve data from file' do
    user_selection = UserSelection.new
    file_name = "../data/#{FuelTrackFile::FUELBRAND}"
    user_selection.file_name = file_name
    expect(user_selection.read_data).to eq(%w[it is working])
  end
end
