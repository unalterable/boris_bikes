require "./lib/bike"

class DockingStation
attr_reader :bikes


  def initialize
    @bikes = []
  end

  def release_bike
    #should pop bike from @bikes array
    Bike.new
  end

  def has_bike?
    @bikes > 0
  end

  def dock(bike)
    @bikes << bike
  end
end
