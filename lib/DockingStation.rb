require_relative 'bike'

class DockingStation
	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def release_bike
		fail "There are no bikes" if @bikes.length == 0
		@bikes.pop
		
	end

	def dock (bike)
		fail "This station is full" if @bikes.length >= 20
		@bikes << bike
		bike
	end

end