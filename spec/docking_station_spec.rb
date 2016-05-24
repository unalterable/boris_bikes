require "dockingStation"
require "bike"

describe DockingStation do
it { is_expected.to respond_to :release_bike }
it "Releases a bike" do
  bike = subject.release_bike
  expect(bike).to be_working
end
end
