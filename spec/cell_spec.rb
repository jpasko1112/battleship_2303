require 'spec_helper'

RSpec.describe Cell do 
    before(:each) do 
        @cell_1 = Cell.new("B4")
        @cell_2 = Cell.new("C3")
        @cruiser = Ship.new("Cruiser", 3)
    end

    describe '#initialize' do
      it 'can initialize' do
        expect(@cell_1).to be_a(Cell)
      end 
    end

    describe '#coordinate' do
      it 'can coordinate cell location' do
        expect(@cell_1.coordinate).to eq("B4")
      end   
    end  

    describe '#ship' do
      it 'can see if ship is in coordinate' do
        expect(@cell_1.ship).to eq(nil)
      end
    end

    describe '#place_ship' do
      it 'places ship in cell' do
        expect(@cell_1.ship).to eq(nil)
        @cell_1.place_ship(@cruiser)
        expect(@cell_1.ship).to eq(@cruiser)
        expect(@cell_1.empty?).to eq(false)
      end
    end

    describe '#fired_upon?' do
      it 'checks if a cell has been fired upon' do
        @cell_1.place_ship(@cruiser)
        expect(@cell_1.fired_upon?).to eq(false)
      end
    end

    describe '#fire_upon' do
      it 'fires at a cell' do
        @cell_1.place_ship(@cruiser)
        expect(@cell_1.fired_upon?).to eq(false)
        @cell_1.fire_upon
        expect(@cell_1.ship.health).to eq(2)
        expect(@cell_1.fired_upon?).to eq(true)
      end
    end

    describe '#render' do
      it 'can render a cell' do
        @cell_1 = Cell.new("B4")
        expect(@cell_1.render).to eq('.')
        @cell_1.fire_upon
        expect(@cell_1.render).to eq('M')
      end

      it 'return render results' do
        @cell_2.place_ship(@cruiser)
        expect(@cell_2.render).to eq('.')
        expect(@cell_2.render(true)).to eq('S')
        @cell_2.fire_upon
        expect(@cell_2.render).to eq('H')
        expect(@cruiser.sunk?).to eq(false)
        @cruiser.hit
        @cruiser.hit
        expect(@cruiser.sunk?).to eq(true)
        expect(@cell_2.render).to eq('X')
      end
    end
end

