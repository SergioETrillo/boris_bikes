class DockingStation

	attr_reader :bike

	def release_bike
		p @bike
		if @bike == nil
			raise "StandardError"
		end
		@bike = Bike.new
	end

	def dock_bike(bike)
		@bike = bike
	end
end

d = DockingStation
