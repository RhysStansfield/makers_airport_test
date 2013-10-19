require_relative 'weather'

class Airport

  include Weather

  attr_reader :planes

  def initialize
    puts 'New flight control shift starting'
    @planes = []
    @capacity = 6
  end

  def land plane
    if full? || stormy?
      puts "Weather unsafe for landing at the moment!"
    else
      @planes << plane
      puts 'Plane successfully landed!'
    end
  end

  def release plane
    if stormy?
      puts 'Weather unsafe for take-off at the moment!'
    else
      puts 'Plane departed successfully!'
      @planes.delete(plane)
    end
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