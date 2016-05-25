require 'docking_station'

describe DockingStation do
	it {is_expected.to respond_to :release_bike}
	it "returns bike & bike is working" do
		bike1 = Bike.new
		subject.dock(bike1)
		bike = subject.release_bike
		expect(bike.working?).to eq true
	end
	it { is_expected.to respond_to(:dock).with(1).argument }
	it { is_expected.to respond_to(:docked?)}
	it "returns array of docked bikes" do
		bike1 = Bike.new
		bike2 = Bike.new
		subject.dock(bike1)
		subject.dock(bike2)
		expect(subject.docked?).to eq [bike1,bike2]
	end
	it "returns an error if no bikes are left." do
		expect {subject.release_bike}.to raise_error("No bikes available")
	end
	it "returns an error if docking station is full" do
		20.times{subject.dock(Bike.new)}
		expect{subject.dock(Bike.new)}.to raise_error("The dock is full")
	end
end
