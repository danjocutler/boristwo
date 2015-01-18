require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	def fill_holder(holder)
		holder.capacity.times { holder.dock(bike) }
	end	

	let(:bike) { double :bike, broken?: false, :class => Bike }
	let (:broken_bike) {double :bike, broken?: true, :class => Bike}
	let(:holder) { ContainerHolder.new }
	
	it "should accept a bike" do
		expect{holder.dock(bike)}.to change{holder.bike_count}.by 1
	end

	it "should release a bike" do
		holder.dock(bike)
		expect{holder.release(bike)}.to change{holder.bike_count}.by -1
	end

	it "should know when it's full" do
		fill_holder holder
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect { holder.dock(bike) }.to raise_error "Sorry. No more room for bikes here."
	end

	it "should provide the list of available bikes" do
		holder.dock(bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([bike])
	end

	it "should provide a list of broken bikes" do
		holder.dock(bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end

	it "should not release anything that is not a bike" do
		expect { holder.release("not bike") }.to raise_error "You have not released a bike"
	end

	it "should not release a bike if empty" do		
		expect { holder.release(bike) }.to raise_error "Sorry. There are no bikes here"
	end
end