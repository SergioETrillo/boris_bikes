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
		@docking_station.dock(@bike)
		bike = @docking_station.release_bike
		expect(bike).to be_working

	end
	
	it "docks a bike" do
		expect(subject).to respond_to(:dock).with(1).argument
	end

	it "check if a bike is docked then I use the docking station" do
		expect(subject.dock(@bike)).to eq @bike
	end
	
	it 'raises error when releasing a bike with zero bikes' do
		expect{subject.release_bike}.to raise_error(RuntimeError, "no bikes")
	end

	it 'raises error when docking a bike on a station with 1 bike' do
		expect{@docking_station.dock(@bike)}.to raise_error(RuntimeError, "Over-Capacity")
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
