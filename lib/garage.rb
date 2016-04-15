class Garage

	attr_accessor :broken_bikes
  attr_reader :working_bikes

	def initialize
		@broken_bikes = []
    @working_bikes = []
	end

	def store(van)
		@broken_bikes += van.unload
	end

  def fix_bikes
    broken_bikes.each {|b|b.fix}
  end

  def select_working_bikes(remaining_capacity)
  	if working_bikes.length <= remaining_capacity
			delivery = working_bikes
		else
			delivery = working_bikes.first(remaining_capacity)
		end
		@working_bikes -= delivery
		delivery
  end
end