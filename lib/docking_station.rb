class DockingStation

	attr_reader :bike

	def release_bike
		#p @bike
		raise "a" if @bike == nil
			 
		@bike = Bike.new
	end

	def dock_bike(bike)
		@bike = bike
	end
end

#d = DockingStation.new
#d.dock_bike(Bike.new)
#d.release_bike

