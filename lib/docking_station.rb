require_relative './bike'
require_relative './van'
require_relative './garage'

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

	def select_broken_bikes(remaining_capacity)
		if broken_bikes.length <= remaining_capacity
			delivery = broken_bikes
		else
			delivery = broken_bikes.first(remaining_capacity)
		end

		@bikes -= delivery
		delivery
	end


	private

		def full?
			@bikes.size >= capacity
		end

		def empty?
			@bikes.empty?
		end

		def broken_bikes
			@bikes.select{ |b| b.broken? }
		end

		def remove_delivery(delivery)
			@bikes -= delivery
		end
end


