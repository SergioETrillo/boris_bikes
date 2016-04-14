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

  def select_working_bikes(remaining_capacity)
  	if bikes.length <= remaining_capacity
			delivery = bikes
		else
			delivery = bikes.first(remaining_capacity)
		end
		@bikes -= delivery
		delivery
  end
end