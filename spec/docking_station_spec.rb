require 'docking_station'

describe DockingStation do

	it {is_expected.to respond_to :release_bike}
	it "has initial capacity is as specified" do
		expect(subject.instance_variable_get(:@capacity)).to eq 20
		subject = DockingStation.new(15)
		expect(subject.instance_variable_get(:@capacity)).to eq 15
		15.times {subject.dock Bike.new}
		expect{subject.dock Bike.new}.to raise_error ("The dock is full")
		subject = DockingStation.new(6)
		expect(subject.instance_variable_get(:@capacity)).to eq 6
		6.times {subject.dock Bike.new}
		expect{subject.dock Bike.new}.to raise_error ("The dock is full")


	end

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

		subject.capacity.times{subject.dock(Bike.new)}
		expect{subject.dock(Bike.new)}.to raise_error("The dock is full")
	end
end
