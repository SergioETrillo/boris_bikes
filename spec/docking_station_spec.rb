require "docking_station"
require "bike"

describe DockingStation do  	
	before(:all) do
		@ds = DockingStation.new
		@bike = @ds.release_bike
	end
	it "responds to release_bike" do 
		expect(@ds).to respond_to(:release_bike) 
	end

	it "gets a bike" do
		
		expect(@bike).to be_an_instance_of(Bike)
		#expect(actual).to be_an_instance_of(expected)
	end

	it "the bike is working" do
		expect(@bike.working?).to be true
	end

	# one liner syntax:
	# it { is_expected.to respond_to :release_bike }
		
end