require 'van'
describe Van do
  let(:broken_bike) { double(:broken_bike, report_broken: true, broken?: true) }
	let(:broken_bike2) { double(:broken_bike2, report_broken: true, broken?: true) }
	let(:bike3) { double(:bike3, report_broken: false, broken?: false) }
  let(:station) { double(:station, :broken_bikes => [broken_bike, broken_bike2]) }
  it { is_expected.to respond_to :collect_broken_bikes } 
  
  it "collects broken bike" do
    allow(station).to receive(:select_broken_bikes).and_return([broken_bike, broken_bike2])
    expect(subject.collect_broken_bikes(station)).to eq [broken_bike, broken_bike2]
  end
end