require_relative 'bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_accessor :capacity

	def initialize (capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		fail "There are no working bikes" unless any_working_bikes?
	    bike_to_remove = bikes.find{|bike| bike.broken? == false}
	    bikes.delete(bike_to_remove)
	end

	def dock (bike)
		fail "This station is full" if full?
		bikes << bike
	end

	def takes_all_broken_bikes
		broken_bikes = finds_all_broken_bikes
		bikes.delete_if{|bike| broken_bikes.include?(bike)}
		broken_bikes
	end

private

	attr_reader :bikes

	def finds_all_broken_bikes
		bikes.select{ |bike| bike.broken?}
	end

	def full?
		bikes.length >= @capacity
	end

	def any_working_bikes?
		all_working_bikes.count > 0
	end

	def all_working_bikes
		bikes.select{|bike| bike.broken? == false}
	end

end