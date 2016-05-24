class DockingStation
  attr_reader :docked_status
  def initialize
    @docked_status = false
  end

  def release_bike
    return Bike.new
  end

  def dock_bike
    @docked_status = true
  end

end