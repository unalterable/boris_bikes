class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def release_bikes
      raise "Bike not available" if empty?
      @bikes.pop
  end

  def dock(bike)
    raise("Docking capacity reached") if full?
    @bikes << bike
  end

  def empty?
    @bikes.count <= 0
  end

  def full?
    @bikes.count >= 20
  end
end
