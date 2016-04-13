require_relative './bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def release_bike
		raise "no bikes" if empty?
		@bikes.pop
	end

	def dock(bike)
		raise "Over-Capacity" if full?
		@bikes << bike
		@bikes.last
	end
	
	private
	
		def full?
			@bikes.size >= DEFAULT_CAPACITY
		end
		
		def empty?
			@bikes.empty?
		end
end


