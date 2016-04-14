require 'garage'
require 'bike'

describe Garage do

	let(:broken_bike) { double(:broken_bike, report_broken: true, broken?: true) }
	let(:broken_bike2) { double(:broken_bike2, report_broken: true, broken?: true) }
  let(:broken_bike3) { double(:broken_bike3, report_broken: true, broken?: true) }
  load = [:broken_bike,:broken_bike2,:broken_bike3]
  let(:van) {double(:van, broken_bikes: load , unload: load)}

  it { is_expected.to respond_to :store, :fix_bikes }

  context 'when creating a new garage' do

  	it 'has no bikes' do
  		expect(subject.bikes).to be_empty
  	end
  end

	context "dealing with vans" do

		it 'stores broken bikes from a van' do
			subject.store(van)
			expect([subject.bikes]).to include (van.broken_bikes.flatten)
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
end