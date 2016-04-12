require_relative 'bike'

class DockingStation

	attr_reader :bike

	def release_bike
		raise "no bikes" unless @bike 
		@bike = Bike.new
	end

	def dock(bike)
		raise "Over-Capacity" if @bike
		@bike = bike
	end
end


