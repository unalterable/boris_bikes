class Bike
	attr_accessor :is_working
	def initialize(working = true)
		@is_working = working
	end

	def working?
		@is_working
	end
end
