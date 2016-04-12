require "docking_station"
require "bike"


describe DockingStation do 

	before(:all) do
		@bike = Bike.new
		@docking_station = DockingStation.new
	end 	
	# one liner syntax:

	it { is_expected.to respond_to :release_bike }


	it "releases working bikes" do
		@docking_station.dock_bike(@bike)
		bike = @docking_station.release_bike
		expect(bike).to be_working
		#expect(actual).to be_an_instance_of(expected)
	end
	
	it "docks a bike" do
		#expect(obj).to respond_to(:foo).with(1).argument
		expect(@docking_station).to respond_to(:dock_bike).with(1).argument
	end

	it "check if a bike is docked then I use the docking station" do

		expect(subject.dock_bike(@bike)).to eq @bike
	end
	
	it 'raises error when releasing a bike with zero bikes' do
		@ds2 = DockingStation.new
		expect{@ds2.release_bike}.to raise_error(RuntimeError, "Zero bikes")
	end

	it 'raises error when docking a bike on a station with 1 bike' do
		@ds3 = DockingStation.new
		@ds3.dock_bike(@bike)
		@b2 = Bike.new 
		expect{@ds3.dock_bike(@b2)}.to raise_error(RuntimeError, "a")
	end
end


=begin
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
=end
