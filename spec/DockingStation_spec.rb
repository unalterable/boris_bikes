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
			bike = Bike.new
			bike.report_broken
			subject.dock(bike)
			expect(subject.release_bike).to eq nil
		end

		it "raises an error when there are no bikes" do
			expect {subject.release_bike}.to raise_error("There are no bikes")
			end
	end

	it "responds to dock" do
		expect(subject).to respond_to(:dock).with(1).argument
	end



	describe "#dock" do

		# it "docks any bike (broken or not)" do
		# 	bike = Bike.new.report_broken
		# 	subject.dock(bike)
		# 	expect(subject.dock(bike)).to eq subject.bikes.pop
		# 	end

		it "raises and error when the docking station is full" do
			subject.capacity.times {subject.dock(Bike.new)}
			expect {subject.dock(Bike.new)}.to raise_error("This station is full")
			end
	end

	# it "returns a docked bike" d
	# 	bike = Bike.new
	# 	subject.dock(bike)
	# 	expect(subject.bikes.last).to eq bike
	# end

	#it "responds to bike method" do
	#	expect(subject).to respond_to :bikes
	#end

end
