require_relative './bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_reader :bikes, :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		raise "no bikes" if empty?
		raise "no working bikes available" if @bikes.last.broken?
		@bikes.pop unless @bikes.last.broken?
	end

	def dock(bike)
		raise "Over-Capacity" if full?
		@bikes << bike
		@bikes.last
	end
	
	private
	
		def full?
			@bikes.size >= capacity
		end
		
		def empty?
			@bikes.empty?
		end
end


