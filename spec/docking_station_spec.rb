require "dockingStation"
require "bike"

describe DockingStation do

it { is_expected.to respond_to :release_bike }

it "Releases a bike" do
  bike = subject.release_bike
  expect(bike).to be_working
end

it { is_expected.to respond_to :has_bike?}

it { is_expected.to respond_to(:dock).with(1).argument}

it "should take a bike raise number of bikes by 1" do

  expect{ subject.dock(Bike.new)}.to change{subject.bikes.count}.by(1)
end

end
