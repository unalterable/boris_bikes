require 'docking_station'

describe DockingStation do

	let(:bike) { double :bike}

	it {is_expected.to respond_to :release_bike}
	it "has initial capacity is as specified" do
		expect(subject.instance_variable_get(:@capacity)).to eq 20
		subject = DockingStation.new(15)
		bike = double(:bike, is_working: true)
		expect(subject.instance_variable_get(:@capacity)).to eq 15
		15.times {subject.dock bike}
		expect{subject.dock bike}.to raise_error ("The dock is full")
		subject = DockingStation.new(6)
		expect(subject.instance_variable_get(:@capacity)).to eq 6
		bike = double(:bike, is_working: true)
		6.times {subject.dock bike}
		expect{subject.dock bike}.to raise_error ("The dock is full")


	end

	it "can return bike" do
		bike1 = double(:bike, is_working: true)
		subject.dock(bike1)
		expect(subject.instance_variable_get(:@bikes)).to eq [bike1]
	end

	it { is_expected.to respond_to(:dock).with(1).argument }
	it { is_expected.to respond_to(:docked?)}
	it "returns array of docked bikes" do
		bike1 = double(:bike)
		bike2 = double(:bike)
		allow(bike1).to receive(:is_working).and_return(true)
		allow(bike2).to receive(:is_working).and_return(true)
		subject.dock(bike1)
		subject.dock(bike2)
		expect(subject.docked?).to eq [bike1,bike2]
	end
	it "returns an error if no bikes are left." do
		expect {subject.release_bike}.to raise_error("No bikes available")
	end
	it "returns an error if docking station is full" do
		bike = double(:bike, is_working: true)
		subject.instance_variable_get(:@capacity).times{subject.dock(bike)}
		expect{subject.dock(double(:bike))}.to raise_error("The dock is full")
	end

	it "broken bikes are pushed into broken bike array" do
		bike1 = double(:bike)
		allow(bike1).to receive(:is_working).and_return(false)
		subject.dock(bike1)
		expect(subject.instance_variable_get(:@broken_bikes)).to eq [bike1]
	end

	it { is_expected.to respond_to(:release_all_broken_bikes)}
	it "broken bikes are released" do
		bike1 = double(:bike, is_working: false)
		subject.dock(bike1)
		expect(subject.release_all_broken_bikes).to eq [bike1]
		expect(subject.instance_variable_get(:@broken_bikes)).to eq []
	end


end
