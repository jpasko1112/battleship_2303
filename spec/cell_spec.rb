require 'spec_helper'

RSpec.describe Cell do 
    before(:each) do 
        @cell = Cell.new("B4")
        @cruiser = Ship.new("Cruiser", 3)
    end

    describe '#initialize' do
      it 'can initialize' do
        expect(@cell).to be_a(Cell)
      end 
    end

    describe '#coordinate' do
      it 'can coordinate cell location' do
        expect(@cell.coordinate).to eq("B4")
      end   
    end  

    describe '#ship' do
      it 'can see if ship is in coordinate' do
        expect(@cell.ship).to eq(nil)
      end
    end

    describe '#place_ship' do
      it 'places ship in cell' do
        expect(@cell.ship).to eq(nil)
        @cell.place_ship(@cruiser)
        expect(@cell.ship).to eq(@cruiser)
        expect(@cell.empty?).to eq(false)
      end
    end

    describe '#fired_upon?' do
      it 'checks if a cell has been fired upon' do
        @cell.place_ship(@cruiser)
        expect(@cell.fired_upon?).to eq(false)
      end
    end

    describe '#fire_upon' do
      it 'fires at a cell' do
        @cell.place_ship(@cruiser)
        expect(@cell.fired_upon?).to eq(false)
        @cell.fire_upon
        expect(@cell.ship.health).to eq(2)
        expect(@cell.fired_upon?).to eq(true)
      end
    end
end