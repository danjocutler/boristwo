module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count()
		bikes.count
	end

	def dock(bike)
		raise "Sorry. No more room for bikes here." if full?
		bikes << bike
	end

	def release(bike)
		raise "You have not released a bike" if bike.class != Bike
		raise "Sorry. There are no bikes here" if empty?
		bikes.delete(bike)
	end

	def full?()
		bike_count == capacity
	end

	def empty?()
		bike_count == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.select {|bike| bike.broken?}
	end

end