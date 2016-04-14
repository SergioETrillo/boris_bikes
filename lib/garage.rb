class Garage

	attr_accessor :bikes

	def initialize
		@bikes = []
	end

	def store(van)
		@bikes += van.unload
	end

  def fix_bikes
    bikes.each {|b|b.fix}
  end

end