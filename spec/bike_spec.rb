require 'bike'

describe Bike do
	it {is_expected.to respond_to :working?}

	it "#working? returns false if bike is not working" do
		expect(subject.working?).to eq true
		subject.is_working = false
		expect(subject.working?).to eq false
	end

end
