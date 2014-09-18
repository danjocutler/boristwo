require 'garage'
require 'bike'

describe Garage do

	def fill_garage(garage)
		garage.capacity.times { garage.dock(Bike.new) }
	end

	let(:bike) { Bike.new }
	let(:garage) { Garage.new }

	it "should fix broken bikes" do
		garage.accept(bike)
		expect(bike).not_to be_broken
	end

	it "should release fixed bikes" do
		garage.dock(bike)
		expect{garage.release(bike)}.to change{garage.bike_count}.by -1
	end


end