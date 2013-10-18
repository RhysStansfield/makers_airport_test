class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def flying_status
    return 'flying' if flying == true
    'landed'
  end

  def land_at airport
    airport.land self
    @flying = false if landed_at? airport
  end

  def take_off_from airport
    airport.release self
    @flying = true unless landed_at? airport
  end

  def landed_at? airport
    airport.planes.include? self
  end

end