require 'docking_station'
require 'garage'
require 'van'

describe Van do

	let(:van) { Van.new }
	let(:bike) { Bike.new }
	let(:station) { DockingStation.new }
	let(:garage) { Garage.new }

	it "should accept broken bikes" do
		van.accept(bike)
		expect(bike).to be_broken
	end

	it "should release fixed bikes" do 
		van.dock(bike)
		expect{van.release(bike)}.to change{van.bike_count}.by -1
	end

	it "should receive broken bikes from the docking station" do
		bike.break!
		station.dock(bike)
		van.receive_broken_bike(station)
		expect(station.bike_count).to eq(0)
		expect(van.bike_count).to eq(1)
	end

	it "should return fixed bikes to the docking station" do
		station.dock(bike)
		van.receive_fixed_bike(van)
		expect(van.bike_count).to eq(0)
		expect(station.bike_count).to eq(1)
	end
end