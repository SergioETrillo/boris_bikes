require "docking_station"
require "bike"

=begin
describe DockingStation do  	
	# one liner syntax:
	it { is_expected.to respond_to :release_bike }


	it "releases working bikes" do
		bike = subject.release_bike
		expect(bike).to be_working
		#expect(actual).to be_an_instance_of(expected)
	end


		
end

=end

describe DockingStation do  	
	before(:all) do
		@ds = DockingStation.new
		@bike = @ds.release_bike
	end
	it "responds to release_bike" do 
		expect(@ds).to respond_to(:release_bike) 
	end

	it "releases a working bike" do
		
		expect(@bike).to be_an_instance_of(Bike)
		expect(@bike.working?).to be true
		#expect(actual).to be_an_instance_of(expected)
	end

	# one liner syntax:
	# it { is_expected.to respond_to :release_bike }
		
end
