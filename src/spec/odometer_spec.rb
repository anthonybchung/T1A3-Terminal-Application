require_relative '../odometer.rb'

RSpec.describe 'Odometer' do
    it 'create a new Odometer class' do
        odometer = Odometer.new
        expect(odometer).to be_kind_of(Odometer)
    end

    it 'accept a value and store it' do
        odometer = Odometer.new
        odometer.distance = 10
        expect(odometer.distance).to be(10)
    end

    it 'raise an error when there is a letter' do
        odometer = Odometer.new
        expect{odometer.distance='12l'}.to raise_error(RuntimeError)
    end

    it 'raise an error if it is not an integer' do
        odometer = Odometer.new
        expect{odometer.distance= 9.81}.to raise_error(RuntimeError)
    end
end