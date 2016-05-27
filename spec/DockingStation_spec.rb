#describe docking station

require 'DockingStation'

describe DockingStation do
	it "responds to release_bike" do
		expect(subject).to respond_to :release_bike
	end

	it "has a default capacity" do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it "allows user to set capacity" do
		subject.capacity = 30
		expect(subject.capacity).to eq 30
	end

	describe "#release_bike" do
		#it "releases the working bike" do
			#bike = subject.release_bike
			#expect(bike).to be_working
		#end

		it "releases a bike if bike is not broken" do
			bike = double(:bike)
			allow(bike).to receive(:broken?).and_return(false)
			subject.dock(bike)
			expect(subject.release_bike).to be bike
		end

		it "raises an error when there are no bikes" do
			expect {subject.release_bike}.to raise_error("There are no working bikes")
		end

		it "returns all working bikes even if one is broken" do
			bike_1 = double(:bike)
			bike_2 = double(:bike)
			bike_3 = double(:bike)
			bike_4 = double(:bike)

			allow(bike_1).to receive(:broken?).and_return(false)
			allow(bike_2).to receive(:broken?).and_return(false)
			allow(bike_3).to receive(:broken?).and_return(true)
			allow(bike_4).to receive(:broken?).and_return(false)

			subject.dock(bike_1)
			subject.dock(bike_2)
			subject.dock(bike_3)
			subject.dock(bike_4)

			expect(subject.release_bike).to eq bike_1
			expect(subject.release_bike).to be bike_2
			expect(subject.release_bike).to be bike_4
			expect{subject.release_bike}.to raise_error
		end


	end

	describe "#dock" do

		it "responds to dock" do
			expect(subject).to respond_to(:dock).with(1).argument
		end
		# it "docks any bike (broken or not)" do
		# 	bike = Bike.new.report_broken
		# 	subject.dock(bike)
		# 	expect(subject.dock(bike)).to eq subject.bikes.pop
		# 	end

		it "raises and error when the docking station is full" do
			subject.capacity.times {subject.dock(double(:bike))}
			expect {subject.dock(double(:bike))}.to raise_error("This station is full")
		end
	end

	describe "#takes_all_broken_bikes" do
	
		it "responds to takes_all_broken_bikes" do
			expect(subject).to respond_to(:takes_all_broken_bikes)
		end	

		it "returns only broken bikes" do
			bike_1 = double(:bike1, broken?: true)
			bike_2 = double(:bike2, :broken? => true)
			bike_3 = double(:bike3, broken?: false)
			bike_4 = double(:bike4, broken?: true)
			subject.dock(bike_1)
			subject.dock(bike_2)
			subject.dock(bike_3)
			subject.dock(bike_4)
			expect(subject.takes_all_broken_bikes).to include(bike_1, bike_2, bike_4)
			expect(subject.takes_all_broken_bikes).not_to include(bike_3)
		end
	# it "returns a docked bike" d
	# 	bike = Bike.new
	# 	subject.dock(bike)
	# 	expect(subject.bikes.last).to eqxw bike
	# end

	#it "responds to bike method" do
	#	expect(subject).to respond_to :bikes
	#end
	end

end
