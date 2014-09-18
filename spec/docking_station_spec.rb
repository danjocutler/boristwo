require 'docking_station'

describe DockingStation  do

	def fill_station(station)
		20.times { station.dock(bike) }
	end	

	let (:bike) { Bike.new }
	let (:station) { DockingStation.new(:capacity => 20) }
	
	it "should accept a bike" do
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end

	it "should release a bike" do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it "should know when it's full" do
		fill_station station
		expect(station).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_station station
		expect { station.dock(bike) }.to raise_error "Sorry. No more room for bikes here."
	end

	it "should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end

	it "should provide a list of broken bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.broken_bikes).to eq([broken_bike])
	end

	it "should not release anything that is not a bike" do
		bike = "Dan", [1, 2, 3]
		expect { station.release(bike) }.to raise_error "You have not released a bike"
	end

	it "should not release a bike if empty" do		
		expect { station.release(bike) }.to raise_error "Sorry. There are no bikes here"
	end

end