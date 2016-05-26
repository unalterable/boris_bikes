require_relative 'bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def release_bike
		fail "There are no bikes" if empty?
		@bikes.pop

	end

	def dock (bike)
		fail "This station is full" if full?
		@bikes << bike
		bike
	end

private

	def full?
		@bikes.length >= DEFAULT_CAPACITY
	end

	def empty?
		@bikes.length == 0
	end


end
