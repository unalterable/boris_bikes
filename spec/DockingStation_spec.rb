#describe docking station

require 'DockingStation'

describe DockingStation do
	it "responds to release_bike" do
		expect(subject).to respond_to :release_bike
	end

	describe "#release_bike" do
		#it "releases the working bike" do
			#bike = subject.release_bike
			#expect(bike).to be_working
		#end

		it "releases a bike" do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it "raises an error when there are no bikes" do
		expect {subject.release_bike}.to raise_error("There are no bikes")
		end
	end

	it "responds to dock" do
		expect(subject).to respond_to(:dock).with(1).argument
	end

	describe "#dock" do
	
		it "docks a bike" do
			bike = Bike.new
			expect(subject.dock(bike)).to eq bike
			end

		it "raises and error when the docking station is full" do
			subject.dock(Bike.new)
			expect {subject.dock(Bike.new)}.to raise_error("This station is full")
			end
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