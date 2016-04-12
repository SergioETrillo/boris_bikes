require_relative 'bike'

class DockingStation

	attr_reader :bike

	def release_bike
		#p @bike
		raise "Zero bikes" if @bike == nil	 
		@bike = Bike.new
	end

	def dock_bike(bike)
		raise "a" if @bike != nil
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

