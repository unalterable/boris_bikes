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
		bikes.pop unless bikes.last.broken?
	end

	def dock (bike)
		fail "This station is full" if full?
		bikes << bike
	end

private

	attr_reader :bikes

	def full?
		bikes.length >= @capacity
	end

	def empty?
		bikes.length == 0
	end

	def any_working_bikes?
		all_working_bikes.count > 0
	end

	def all_working_bikes
		bikes.select{|bike| bike.broken? == false}
	end

end
