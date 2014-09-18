require_relative 'bike_container'

class Garage

	include BikeContainer

	def accept(bike)
		bike.break!
		bike.fix!
		dock(bike)
	end

end