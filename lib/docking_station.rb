require_relative 'bike'

class DockingStation
	DEFAULT_CAPACITY = 20
	attr_reader :bikes
	def initialize
		@bikes = []
	end



	def release_bike
		fail 'No bikes available' if empty?
		@bikes.pop
	end

	def dock(bike)
		fail 'The dock is full' if full?
		@bikes << bike
	end

	def docked?
		if @bikes != nil then return @bikes
		else return false
		end
	end

	private

	def full?
		bikes.size == DEFAULT_CAPACITY ? true : false
	end

	def empty?
		@bikes.empty? ? true : false
	end
end
