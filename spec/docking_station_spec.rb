require 'docking_station'

describe DockingStation do
	it {is_expected.to respond_to :release_bike}
	it "returns bike & bike is working" do
		bike = subject.release_bike
		expect(bike.working?).to eq true
	end
	it { is_expected.to respond_to(:dock).with(1).argument }
	it { is_expected.to respond_to(:docked)}
	it "returns true if bike is docked" do
		bike = subject.release_bike
		subject.dock(bike)
		expect(subject.docked).to eq true
	end
	it "returns an error if no bikes are left." do
		expect {subject.release_bike}.to raise_error("No bikes available.")
	end
end
