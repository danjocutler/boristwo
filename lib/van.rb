require_relative 'bike_container'

class Van

	include BikeContainer

	def accept(bike)
		bike.break!
		dock(bike)
	end

	def receive_broken_bike(station)
		station.broken_bikes.each do |broken_bikes| 
		dock(broken_bikes)
		station.release(broken_bikes)
		end
	end

	def receive_fixed_bike(van)
		van.available_bikes.each do |available_bikes|
		dock(available_bikes)
		van.release(available_bikes)
		end
	end

end