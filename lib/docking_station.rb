require_relative 'bike_container'

class DockingStation

	include BikeContainer

def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

end
# 	DEFAULT_CAPACITY = 10
# 		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
# 		@bikes = []
# 	end

# 	def bike_count()
# 		@bikes.count
# 	end

# 	def dock(bike)
# 		raise "Sorry. No more room for bikes here." if full?
# 		@bikes << bike
# 	end

# 	def release(bike)
# 		raise "You have not released a bike" if bike.class != Bike
# 		raise "Sorry. There are no bikes here" if empty?
# 		@bikes.delete(bike)
# 	end

# 	def full?()
# 		bike_count == @capacity
# 	end

# 	def empty?()
# 		bike_count == 0
# 	end

# 	def available_bikes
# 		@bikes.reject {|bike| bike.broken?}
# 	end

	# def broken_bikes
	# 	@bikes.select {|bike| bike.broken?}
	# end
# end