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
		bike = subject.release_bike
		expect(bike).to be_working
		#expect(actual).to be_an_instance_of(expected)
	end
	
	it "docks a bike" do

		#expect(obj).to respond_to(:foo).with(1).argument
		expect(@docking_station).to respond_to(:dock_bike).with(1).argument
	end

	it "check if a bike is docked then I use the docking station" do
		expect(@docking_station.dock_bike(@bike)).to eq @bike
	end
	
	it 'raises error when releasing a bike with zero bikes' do
		
		expect{@docking_station.release_bike}.to raise_error
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
