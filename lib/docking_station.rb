require_relative 'bike'

class DockingStation
	attr_reader :docked_bike

	def release_bike
		if @docked_bike == nil
			raise "No bikes available."
		else Bike.new
		end
	end
	
	def dock(bike)
		@docked_bike = bikee
	end
	
	def docked
		if @docked_bike != nil then return @docked_bike
		else return false
		end	
	end
end
