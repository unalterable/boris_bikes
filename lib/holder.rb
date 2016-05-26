module holder

  def give_all
    sum = []
    broken_bikes.size.times{sum << release_broken_bike}
    sum
  end

  def receive(received_items)
    received_items.each{|i| dock(i)}
  end
