#describe docking station

require 'DockingStation'

describe DockingStation do
	it "responds to release_bike" do
		expect(subject).to respond_to :release_bike
	end
	it "releases the working bike" do
		bike = subject.release_bike
		expect(bike).to be_working
	end
	it "responds to dock" do
		expect(subject).to respond_to(:dock).with(1).argument
	end

	it "docks a bike" do
		bike = Bike.new
		expect(subject.dock(bike)).to eq bike
	end

	it "returns a docked bike" do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bike).to eq bike
	end

	it "responds to bike method" do
		expect(subject).to respond_to :bike
	end
end