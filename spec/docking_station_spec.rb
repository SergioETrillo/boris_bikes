require "docking_station"

describe DockingStation do 

	subject(:ds) {DockingStation.new}

	it { is_expected.to respond_to :release_bike }

	context "#release_bike" do	
		it "releases working bikes" do
			ds.dock(Bike.new)
			bike = ds.release_bike
			expect(bike).not_to be_broken
		end
		
		it "does not release broken bikes" do
			broken_bike = Bike.new
			broken_bike.report_broken
			ds.dock(broken_bike)
			# expect(subject.release_bike).to be nil
			expect{ds.release_bike}.to raise_error(RuntimeError, "no working bikes available")
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
		
		it "docks a broken bike" do
			broken_bike = Bike.new
			broken_bike.report_broken
			expect(subject.dock(broken_bike)).to eq broken_bike
		end
	end
	
	context "test exceptions" do
		it 'raises error when releasing a bike with zero bikes' do
			expect{subject.release_bike}.to raise_error(RuntimeError, "no bikes")
		end
	
		it 'raises error when docking on a full station' do 
			ds.capacity.times { subject.dock(Bike.new) }
			expect{subject.dock(Bike.new)}.to raise_error(RuntimeError, "Over-Capacity")
		end

		it 'sets new docking station with capacity 35' do
			ds = DockingStation.new(35)
			expect(ds.capacity).to eq 35
		end

		it 'sets new docking station with default capacity' do
			expect(ds.capacity).to eq 20
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
