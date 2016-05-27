require 'van'

describe Van do
	
	describe "#accept_bikes" do

		it "has the method" do
			expect(subject).to respond_to(:accept_bikes).with(1).argument
		end
		it "actually has the bikes" do
			array_of_bikes = [double(:bike),double(:bike),double(:bike),double(:bike)]
			subject.accept_bikes(array_of_bikes)
			expect(subject.instance_variable_get(:@cargo)).to eq(array_of_bikes)
		end

	end

	describe "#unload_bikes" do
		it "has the method" do
			expect(subject).to respond_to(:unload_bikes)
		end
		it "returns an array" do
			expect(subject.unload_bikes).to be_a(Array)
		end	
		# it "returns an array of loaded bikes" do
		# 	array_of_bikes = [double(:bike),double(:bike),double(:bike),double(:bike)]
		# 	subject.accept_bikes(array_of_bikes)
		# 	expect(subject.unload_bikes).to eq(array_of_bikes)
		# end

	end


end