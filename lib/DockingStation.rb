class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  def initialize capacity = DEFAULT_CAPACITY
    @bikes = []
    @capacity = capacity
  end

  def release_bike
      raise "Bike not available" if empty?
      bikes.pop
  end

  def dock(bike)
    raise("Docking capacity reached") if full?
    bikes << bike
  end

private

  attr_reader :bikes

  def empty?
    bikes.count <= 0
  end

  def full?
    bikes.count >= @capacity
  end
end


