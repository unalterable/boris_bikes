require_relative 'bike'

class DockingStation
	attr_reader :docked_bike

	def release_bike
		fail 'No bikes available' unless @docked_bike
		@docked_bike
	end

	def dock(bike)
		 if (@docked_bike.instance_of? Bike)
			 fail 'The dock is full'
		else
			 @docked_bike = bike
		 end
	end

	def docked?
		if @docked_bike != nil then return @docked_bike
		else return false
		end
	end
end
