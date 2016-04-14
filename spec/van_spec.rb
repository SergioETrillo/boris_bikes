require 'van'

describe Van do

  let(:broken_bike) { double(:broken_bike, report_broken: true, broken?: true) }
	let(:broken_bike2) { double(:broken_bike2, report_broken: true, broken?: true) }
  let(:broken_bike3) { double(:broken_bike3, report_broken: true, broken?: true) }
	let(:bike3) { double(:bike3, report_broken: false, broken?: false) }
  let(:station) { double(:station, :broken_bikes => [broken_bike, broken_bike2]) }
  let(:station_3) { double(:station_3, :broken_bikes => [broken_bike, broken_bike2,broken_bike3]) }
  let(:garage) {double(:garage, )}
  context 'when creating a new van' do

		it 'should have no broken bikes' do
			expect(subject.broken_bikes).to be_empty
		end

		it { is_expected.to respond_to :collect_broken_bikes, :load }

		it 'capacity is 2' do
			expect(Van::DEFAULT_CAPACITY).to eq 20
		end

    it 'remaining capacity is 2' do
      expect(subject.remaining_capacity).to eq 20
    end
	end

  context 'when collecting broken bikes from dockingstation' do
	
	

    it "collects broken bikes" do
      allow(station).to receive(:select_broken_bikes).and_return([broken_bike, broken_bike2])
      expect(subject.collect_broken_bikes(station)).to eq [broken_bike, broken_bike2]
    end

  end

  context ' when delivering to garages' do

  	it 'unloading broken bikes' do
  		allow(station).to receive(:select_broken_bikes).and_return([broken_bike, broken_bike2])
  		subject.collect_broken_bikes(station)
  		expect(subject.unload).to eq [broken_bike, broken_bike2]
  	end

  	it 'van is empty after unloading' do
  		allow(station).to receive(:select_broken_bikes).and_return([broken_bike, broken_bike2])
  		subject.collect_broken_bikes(station)
  		subject.unload
  		expect(subject.broken_bikes).to be_empty
  	end

  end

end