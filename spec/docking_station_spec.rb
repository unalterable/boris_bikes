require "dockingStation"
require "bike"

describe DockingStation do

it { is_expected.to respond_to :release_bike }

it "Raises an error if there are no bikes left" do
expect {subject.release_bike}.to raise_error("no more bikes")
end

it { is_expected.to respond_to :has_bike?}

it { is_expected.to respond_to(:dock).with(1).argument}

it "should take a bike raise number of bikes by 1" do

  expect{ subject.dock(Bike.new)}.to change{subject.bikes.count}.by(1)
end

it "Releases a bike" do
  subject.dock(Bike.new)
  expect{subject.release_bike}.to change{subject.bikes.count}.by(-1)
end

end
