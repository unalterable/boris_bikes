require 'holder'

shared_examples_for "a holder" do
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
end
