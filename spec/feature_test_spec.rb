describe "feature test" do
  it "works" do
    station = DockingStation.new
    bike1 = Bike.new(false)
    station.dock(bike1)
    broken_bikes = station.release_all_broken_bikes
    van1 = Van.new
    van1.pickup(broken_bikes)
    unloaded_broken_bikes = van1.dropoff_all
    garage1 = Garage.new
    garage1.receive(unloaded_broken_bikes)
    garage1.fix_bikes
    fixed_bikes = garage1.give_all
    van2 = Van.new
    van2.pickup(fixed_bikes)
    unloaded_fixed_bikes = van2.dropoff_all
    station.receive(unloaded_fixed_bikes)
  end
end
