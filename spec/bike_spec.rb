#describe the bike class

require 'bike'

describe Bike do
	it "checks if bike is working" do
		expect(subject).to respond_to :broken?
	end

	it "allows users to report broken bikes" do
		subject.report_broken
		expect(subject).to be_broken
	end
end
