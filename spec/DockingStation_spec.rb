require 'DockingStation'
require 'bike'

# subject = DockingStation.new

describe DockingStation do
  let(:bike) { Bike.new }

  it { should be_instance_of(DockingStation)}

  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'should return bike if one is docked' do
    subject.dock(bike)
    expect(subject.release_bike).to eq(bike)
  end

  it 'returns the bike if bike has been docked' do
  subject.dock(bike)
  expect(subject.release_bike).to eq(bike)
  end

  it 'should not give out infinite bikes' do
    expect { subject.release_bike }.to raise_error("Bike not available")
  end

  it 'should not allow docking if full (capacity = 20)' do
    subject.class::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
    expect {subject.dock(Bike.new)}.to raise_error("Docking capacity reached")
  end

    it 'should allow specified capacities' do
      dock_a = DockingStation.new(40)
      20.times {dock_a.dock(Bike.new)}
      expect(dock_a.release_bike).to be_a(Bike)
      21.times {dock_a.dock(Bike.new)}
      expect {dock_a.dock(Bike.new)}.to raise_error("Docking capacity reached")
  end

  it 'should not release a bike if only bike is broken' do
    bike_a = Bike.new
    dock_a = DockingStation.new
    dock_a.dock(bike_a, true)
    expect{ dock_a.release_bike }.to raise_error("Bike not available")
  end
end
