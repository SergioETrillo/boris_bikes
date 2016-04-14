require 'garage'
require 'bike'

describe Garage do

	let(:broken_bike) { double(:broken_bike, report_broken: true, broken?: true) }
	let(:broken_bike2) { double(:broken_bike2, report_broken: true, broken?: true) }
  let(:broken_bike3) { double(:broken_bike3, report_broken: true, broken?: true) }
  load = [:broken_bike,:broken_bike2,:broken_bike3]
  let(:bike) { double(:bike, report_broken: false, ) }
  let(:van) { double(:van, remaining_capacity: 2, broken_bikes: load , unload: load) }
  subject(:garage) { Garage.new }

  it { is_expected.to respond_to :store, :fix_bikes, :select_working_bikes }

  context 'when creating a new garage' do

  	it 'has no bikes' do
  		expect(subject.bikes).to be_empty
  	end
  end

	context "dealing with vans" do

		it 'stores broken bikes from a van' do 
			subject.store(van)
			expect(subject.bikes).to include *(van.broken_bikes)
		end


	end

  context "when fixing the bike" do

    it 'calls Bike#fix on each of the bikes in the storage' do
      20.times do
        bike = Bike.new
        bike.report_broken
        subject.bikes << bike
      end
      subject.fix_bikes
      all_fixed = subject.bikes.none? {|b|b.broken?}
      expect(all_fixed).to be true
    end
  end

  context "#select_working_bikes" do

		context "when there are fewer or equal number of broken bikes than remaining capacity" do

			it "releases a working bike" do
				garage.bikes << bike
				expect(garage.select_working_bikes(van.remaining_capacity)).to eq [bike]
			end

			xit "removes all broken bikes from station" do
				ds.dock(bike)
				ds.dock(broken_bike)
				ds.dock(broken_bike2)
				ds.select_broken_bikes(van.remaining_capacity)
				expect(ds.bikes).to eq [bike]
			end
		end

		context "when there are more broken bikes than the remaining capacity of van" do

			xit "only release bikes until the van is full" do
				ds.dock(broken_bike)
				ds.dock(broken_bike2)
				ds.dock(broken_bike3)
				expect(ds.select_broken_bikes(van.remaining_capacity)).to eq [broken_bike,broken_bike2]
			end

			xit "retain excessive broken bikes that are not released" do
				ds.dock(broken_bike)
				ds.dock(broken_bike2)
				ds.dock(broken_bike3)
				ds.select_broken_bikes(van.remaining_capacity)
				expect(ds.bikes).to eq [broken_bike3]
			end
		end
	end


end