require_relative 'weather'

class Airport

  include Weather

  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 6
  end

  def land plane
    @planes << plane unless full? || stormy?
  end

  def release plane
    @planes.delete(plane) unless stormy?
  end

  def planes_count
    @planes.count
  end

  def full?
    planes_count == @capacity
  end

  def load plane
    @planes << plane
  end

end