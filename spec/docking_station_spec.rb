require "docking_station"

describe DockingStation do 

	let(:bike) { double(:bike) }
	let(:broken_bike) { double(:broken_bike, report_broken: true, broken?: true) }
	let(:broken_bike2) { double(:broken_bike2, report_broken: true, broken?: true) }

	subject(:ds) {DockingStation.new}

	it { is_expected.to respond_to :release_bike }

	context "#release_bike" do	

		it "releases working bikes" do
			ds.dock(bike)
			allow(bike).to receive(:broken?).and_return(false)
			bike = ds.release_bike
			expect(bike).not_to be_broken
		end
		
		it "does not release broken bikes" do
			#allow(broken_bike).to receive(:report_broken).and_return(true)
			#allow(broken_bike).to receive(:broken?).and_return(true)
			ds.dock(broken_bike)
			expect{ds.release_bike}.to raise_error(RuntimeError, "no working bikes available")
		end
	end
	
	context "#dock" do

		it "responds to dock with 1 argument" do
			expect(subject).to respond_to(:dock).with(1).argument 
		end
	  
		it "docks a bike" do
			expect(subject.dock(bike)).to eq bike
		end
		
		it "docks a broken bike" do
			allow(broken_bike).to receive(:report_broken).and_return(true)
			expect(subject.dock(broken_bike)).to eq broken_bike
		end
	end
	
	context "test exceptions" do

		it 'raises error when releasing a bike with zero bikes' do
			expect{subject.release_bike}.to raise_error(RuntimeError, "no bikes")
		end
	
		it 'raises error when docking on a full station' do 
			ds.capacity.times { subject.dock(bike) }
			expect{subject.dock(bike)}.to raise_error(RuntimeError, "Over-Capacity")
		end

		it 'sets new docking station with capacity 35' do
			ds = DockingStation.new(35)
			expect(ds.capacity).to eq 35
		end

		it 'sets new docking station with default capacity' do
			expect(ds.capacity).to eq 20
		end

	end
	
	it "selects ALL broken bikes" do
		ds.dock(broken_bike)
		ds.dock(broken_bike2)
		expect(ds.select_broken_bikes).to eq [broken_bike, broken_bike2]
	end
end