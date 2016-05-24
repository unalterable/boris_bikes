require "dockingStation"
require "bike"

describe DockingStation do
it { is_expected.to respond_to :release_bike }
it "Releases a bike" do
  expect(subject.release_bike).to be_kind_of Bike
end
end
