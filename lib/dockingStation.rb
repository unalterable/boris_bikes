require "./lib/bike"

class DockingStation
attr_reader :bikes


  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes.count < 1
      raise "no more bikes"
    else
      @bikes.pop
    end
  end

  def has_bike?
    @bikes > 0
  end

  def dock(bike)
    @bikes << bike
  end
end
