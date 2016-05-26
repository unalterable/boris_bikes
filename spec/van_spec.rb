require 'van'

describe Van do
  it { is_expected.to respond_to(:pickup).with(1).argument}
  it "stores items that have been picked up" do
    subject.pickup(["e1","e2","e3"])
    expect(subject.instance_variable_get(:@stored)).to eq ["e1","e2","e3"]
  end
  it { is_expected.to respond_to(:dropoff_all)}
  it "drops off all stored items" do
    subject.pickup(["a1","a2","a3","a4"])
    expect(subject.dropoff_all).to eq ["a1","a2","a3","a4"].reverse
    bike1 = double(:bike, is_working: false)
    5.times{subject.pickup([bike1])}
    expect(subject.dropoff_all).to eq [bike1,bike1,bike1,bike1,bike1]
  end

end
