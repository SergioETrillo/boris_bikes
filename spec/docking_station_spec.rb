require "docking_station"

describe DockingStation do 

	it { is_expected.to respond_to :release_bike }

	context "#release_bike" do	
		it "releases working bikes" do
			subject.dock(Bike.new)
			bike = subject.release_bike
			expect(bike).to be_working
		end
	end
	
	context "#dock" do
		it "responds to dock with 1 argument" do
			expect(subject).to respond_to(:dock).with(1).argument 
		end
	  
		it "docks a bike" do
			bike = Bike.new
			expect(subject.dock(bike)).to eq bike
		end
	end
	
	context "test exceptions" do
		it 'raises error when releasing a bike with zero bikes' do
			expect{subject.release_bike}.to raise_error(RuntimeError, "no bikes")
		end
	
		it 'raises error when docking on a full station' do 
			DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
			expect{subject.dock(Bike.new)}.to raise_error(RuntimeError, "Over-Capacity")
		end
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
