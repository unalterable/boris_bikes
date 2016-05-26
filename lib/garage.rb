class Garage

  def initialize
    @stored = []
  end

  def receive(things_received)
    stored.concat(things_received)
  end

  def give_all
     sum = []
     stored.size.times{ sum << give_item}
     sum
  end

  def fix_bikes
    stored.each{|b| b.is_working = true}
  end
  
  private

  attr_reader :stored

  def give_item
    stored.pop
  end
end
