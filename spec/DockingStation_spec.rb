require 'DockingStation'
require 'bike'

  dock_a = DockingStation.new

  describe DockingStation do

  it { should be_instance_of(DockingStation)}

  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'returns empty array if no bike has been docked' do
  expect(dock_a.bike).to eq([])
  end

  it 'should return bike if one is docked' do
  dock_a.dock("bike3")
  expect(dock_a.bike.count).to eq 1
  expect(dock_a.release_bike).to eq("bike3")
  end

  it 'returns the bike if bike has been docked' do
  dock_a.dock("bike3")
  expect(dock_a.bike.count).to eq 1
  expect(dock_a.bike).to eq(["bike3"])
  end

  it 'should not give out infinite bikes' do
    expect { subject.release_bike }.to raise_error("Bike not available")
  end

  it 'should not allow docking if full (capacity =1)' do
  expect(dock_a.bike.count).to eq 1
  expect {dock_a.dock("Bike4")}.to raise_error("Docking capacity reached")
  end
  end


