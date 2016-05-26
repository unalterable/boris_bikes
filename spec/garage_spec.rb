require 'garage'
require 'bike'

describe Garage do
  it { is_expected.to respond_to(:receive).with(1).argument}
  it "stores items that have been recieve" do
    subject.receive(["e1","e2","e3"])
    expect(subject.instance_variable_get(:@stored)).to eq ["e1","e2","e3"]
  end
  it { is_expected.to respond_to(:give_all)}
  it "give all stored items" do
    subject.receive(["a1","a2","a3","a4"])
    expect(subject.give_all).to eq ["a1","a2","a3","a4"].reverse
    bike1 = double(:bike, is_working: false)
    5.times{subject.receive([bike1])}
    expect(subject.give_all).to eq [bike1,bike1,bike1,bike1,bike1]
  end
  it { is_expected.to respond_to(:fix_bikes)}
  it "fixes all bikes" do
    bike1 = Bike.new(false)
    bike2 = Bike.new(false)
    subject.receive([bike1, bike2])
    subject.fix_bikes
    subject.instance_variable_get(:@stored).each do |bike|
      expect(bike).to be_working
    end
  end
end
