require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane, flying: :something }
  
  context 'taking off and landing' do
    it 'a plane can land' do
      Airport.any_instance.stub(:stormy?) { false }
      plane = Plane.new
      plane.land_at airport
      expect(airport.planes_count).to eq 1
    end
    
    it 'a plane can take off' do
      Airport.any_instance.stub(:stormy?) { false }
      airport.land plane
      airport.release plane
      expect(airport.planes_count).to eq 0
    end
  end
  
  context 'traffic control' do

    it 'can tell when its full' do
      Airport.any_instance.stub(:stormy?) { false }
      6.times { airport.land plane }
      expect(airport.full?).to eq true
    end

    it 'can count how many planes it has in it' do
      Airport.any_instance.stub(:stormy?) { false }
      3.times { airport.land plane }
      expect(airport.planes_count).to eq 3
    end

    it 'a plane cannot land if the airport is full' do
      Airport.any_instance.stub(:stormy?) { false }
      plane = double :plane
      7.times { airport.land plane }
      expect(airport.planes_count).to eq 6
    end
    
    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
        Airport.any_instance.stub(:stormy?) { true }
        plane = double :plane
        airport.load plane
        airport.release plane
        expect(airport.planes_count).to eq 1
      end
      
      it 'a plane cannot land in the middle of a storm' do
        Airport.any_instance.stub(:stormy?) { true }
        plane = double :plane
        airport.land plane
        expect(airport.planes_count).to eq 0
      end
    end
  end
end