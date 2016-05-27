class Van

	attr_accessor :cargo
	def initialize 
		@cargo = []
	end

	def accept_bikes(array_of_bikes)
		cargo.concat(array_of_bikes)
	end

	def unload_bikes
		cargo
	end

	private

end