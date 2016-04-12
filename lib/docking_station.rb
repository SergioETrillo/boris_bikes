require_relative 'bike'

class DockingStation

	attr_reader :bike

	def release_bike
		#p @bike
		raise "no bikes" if @bike == nil	 
		@bike = Bike.new
	end

	def dock(bike)
		raise "Over-Capacity" if @bike
		@bike = bike
		p bike
	end
end

# d = DockingStation.new
# p d.bike
# d.dock_bike(Bike.new)
# d.dock_bike(Bike.new)
# d.dock_bike(Bike.new)
# d.dock_bike(Bike.new)

