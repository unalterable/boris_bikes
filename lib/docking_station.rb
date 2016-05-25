require_relative 'bike'

class DockingStation
	DEFAULT_CAPACITY = 20
	attr_reader :bikes, :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
		@broken_bikes = []
	end

	def release_bike
		fail 'No bikes available' if empty?
		@bikes.pop
	end

	def dock(bike)
		fail 'The dock is full' if full?
		bike.is_working ? @bikes << bike : @broken_bikes << bike
	end

	def docked?
		if @bikes != nil then return @bikes
		else return false
		end
	end

	private

	def full?
		(@bikes.size + @broken_bikes.size) == @capacity ? true : false
	end

	def empty?
		@bikes.empty? ? true : false
	end
end
