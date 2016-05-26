class Van

  def initialize
    @stored = []
  end

  def pickup(things_to_pickup)
    stored.concat(things_to_pickup)
  end

  def dropoff_all
     sum = []
     stored.size.times{ sum << release_item}
     sum
  end

  private

  attr_reader :stored

  def release_item
    stored.pop
  end
end
