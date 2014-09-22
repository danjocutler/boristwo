require 'van'

describe Van do

	let(:van) { Van.new }
	let!(:bike) { double :bike, :class => Bike, :break! => true, :broken? => true }
	let(:station) { double :docking_station, :dock => true, bikes: [bike],:broken_bikes => [bike], :bike_count => nil }
	let(:garage) { Garage.new }

	it "should accept broken bikes" do
		van.accept(bike)
		expect(bike).to be_broken
	end

	it "should release fixed bikes" do 
		van.dock(bike)
		expect{van.release(bike)}.to change{van.bike_count}.by -1
	end

	it "should remove broken bikes from station" do
		expect(station).to receive(:release).with bike
		van.receive_broken_bike(station)
		# expect(van.bike_count).to eq(1)
	end


	it "should receive broken bikes from the docking station" do
		allow(station).to receive(:release).with bike
		van.receive_broken_bike(station)
		expect(van.bike_count).to eq(1)
	end

	it "should return fixed bikes to the docking station" do
		allow(station).to receive(:dock).with bike
		van.receive_fixed_bike(van)
		expect(van.bike_count).to eq(0)
	end
end