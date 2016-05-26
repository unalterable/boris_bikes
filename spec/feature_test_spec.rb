require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe "feature test" do
  it "works" do
    station = DockingStation.new
    bike1 = Bike.new(false)
    station.dock(bike1)
    brokenbikes = station.release_all_broken_bikes
    van1 = Van.new
    van1.pickup(brokenbikes)
    unloadedbb = van1.dropoff_all
  #  garage1 = Garage.new

  end
end
