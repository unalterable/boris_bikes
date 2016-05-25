class DockingStation
  attr_reader :bike
  def initialize
    @bike = []
  end

  def release_bike
      raise "Bike not available" if empty?
      @bike.pop
  end

  def dock(bike)
    raise "Docking capacity reached" unless empty?
    @bike << bike
  end

  def empty?
    @bike.count <= 0
  end
end