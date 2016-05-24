require_relative 'bike'

class DockingStation
	attr_reader :docked_bike

	def release_bike
		Bike.new
	end
	
	def dock(bike)
		@docked_bike = bike
	end
	
	def docked
		if @docked_bike != nil then return true
		else return false
		end	
	end
end
