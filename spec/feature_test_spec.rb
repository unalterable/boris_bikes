require 'docking_station'
require 'bike'
require 'van'

describe "feature test" do
  it "works" do
    station = DockingStation.new
    bike1 = Bike.new(false)
    station.dock(bike1)
    brokenbikes = station.release_all_broken_bikes
    van1 = Van.new
    van1.pickup(brokenbikes)
    unloadedbb = van1.dropoff_all
    garage1 = Garage.new
    garage1.receive(unloadedbb)
    garage1.fix_bikes
    fixedbikes = garage1.give_all
    van2 = Van.new
    van2.pickup(fixedbikes)
    unloadedfb = van2.dropoff_all
    station.receive(unloadedfb)

  end
end
