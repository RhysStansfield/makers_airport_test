require 'airport'
require 'plane'

describe "The grand finale (last spec)" do

  # Monster-mega-test-'o'-doom - with no fewer than four expects in...oh dear...

  it 'all planes can land and all planes can take off' do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    plane5 = Plane.new
    plane6 = Plane.new
    planes = [plane1, plane2, plane3, plane4, plane5, plane6]
    planes.each do |plane|
      until plane.flying == false
        plane.land_at airport
      end
    end
    expect(airport.full?).to be_true
    expect(plane1.flying_status).to eq 'landed'
    planes.each do |plane|
      until plane.flying == true
        plane.take_off_from airport
      end
    end
    expect(airport.planes_count).to be 0
    expect(plane1.flying_status).to eq 'flying'
  end
end