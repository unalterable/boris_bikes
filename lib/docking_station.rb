require_relative 'bike'

class DockingStation
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
		@broken_bikes = []
	end

	def release_bike
		fail 'No bikes available' if empty?
		bikes.pop
	end

	def dock(bike)
		fail 'The dock is full' if full?
		bike.is_working ? bikes << bike : broken_bikes << bike
	end

	def docked?
		if bikes != nil then return bikes
		else return false
		end
	end

	def release_all_broken_bikes
		sum = []
		broken_bikes.size.times{sum << release_broken_bike}
		sum
	end

	def receive(received_items)
		received_items.each{|i| dock(i)}
	end


	private

	attr_reader :bikes, :capacity, :broken_bikes

	def release_broken_bike
		broken_bikes.pop
	end

	def full?
		(bikes.size + broken_bikes.size) == capacity
	end

	def empty?
		bikes.empty?
	end
end
