require_relative './bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def release_bike
		raise "no bikes" if @bikes.empty?
		@bikes.pop
	end

	def dock(bike)
		raise "Over-Capacity" if @bikes.size >= DEFAULT_CAPACITY
		@bikes << bike
		@bikes.last
	end
end


