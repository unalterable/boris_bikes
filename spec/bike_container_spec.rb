require 'bike_container'

shared_examples_for "a bike container" do
  let(:bikecontainer) { Class.new {include BikeContainer}}

  context "initialized with 3 items" do
    it "fails cos reasons" do
      bikecontainer.fish.should eq(4)
    end
  end
end
