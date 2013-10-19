require 'plane'
require 'airport'

describe Plane do

  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
    expect(plane.flying_status).to eq 'Now flying'
  end
  
  it 'has a flying status when in the air' do
    plane.flying
    expect(plane.flying_status).to eq 'Now flying'
  end

  it 'has a landed status when not in the air' do
    plane.flying = false
    expect(plane.flying_status).to eq 'Now landed'
  end
  
  it 'can take off' do
    airport = double :airport, { release: nil, planes: [] }
    expect(airport).to receive(:release)
    plane.take_off_from airport
  end

  it 'can land at an airport' do
    airport = double :airport, { planes: [] }
    expect(airport).to receive(:land).with(plane)
    plane.land_at airport
  end

  it 'can check that it is landed' do
    airport = Airport.new
    Airport.any_instance.stub(:stormy?) { false }
    plane.land_at airport
    expect(plane.landed_at? airport).to be_true
  end

  it 'changes its status to landed when at airport' do
    airport = Airport.new
    Airport.any_instance.stub(:stormy?) { false }
    plane.land_at airport
    expect(plane.flying_status).to eq 'Now landed'
  end
  
  it 'changes its status to flying after taking of' do
    airport = Airport.new
    Airport.any_instance.stub(:stormy?) { false }
    plane.land_at airport
    plane.take_off_from airport
    expect(plane.flying_status).to eq 'Now flying'
  end
end