class Garage

	attr_reader :bikes 

	def initialize
		@bikes = []
	end

	def store(van)
		@bikes += van.unload
	end

end