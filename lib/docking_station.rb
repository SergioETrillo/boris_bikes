require_relative './bike'

class DockingStation

	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def release_bike
		raise "no bikes" if @bikes.empty?
		@bikes = Bike.new
	end

	def dock(bike)
		raise "Over-Capacity" if @bikes.size >= 20
		@bikes << bike
		@bikes.last
	end
end


