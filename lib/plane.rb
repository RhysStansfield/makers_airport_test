class Plane

  attr_accessor :flying

  def initialize
    puts 'New flight inbound'
    @flying = true
  end

  def flying_status
    if flying
      'The plane is currently flying'
    else
      'The plane is currently landed'
    end
  end

  def land_at airport
    return 'Already landed!' if flying == false
    airport.land self
    @flying = false if landed_at? airport
    puts flying_status
  end

  def take_off_from airport
    return 'Already flying!' if flying
    airport.release self
    @flying = true unless landed_at? airport
    puts flying_status
  end

  def landed_at? airport
    airport.planes.include? self
  end

end