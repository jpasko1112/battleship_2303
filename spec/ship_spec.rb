require 'spec_helper'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new('Cruiser', 3)
  end

  describe '#initialize' do
    it 'can initalize' do
      expect(@cruiser).to be_a(Ship)
    end

    it 'initializes with a name' do
      expect(@cruiser.name).to eq('Cruiser')
    end

    it 'initializes with a length' do
      expect(@cruiser.length).to eq(3)
    end
  end

  describe '#health' do
    it 'returns the ships health' do
      expect(@cruiser.health).to eq(3)
    end
  end

  describe '#sunk?' do
    it 'returns true if the ship is sunk and defaults to false' do
      expect(@cruiser.sunk?).to eq(false)
    end
  end

  describe '#hit' do
    it 'reduces health by 1' do
      expect(@cruiser.health).to eq(3)
      @cruiser.hit
      expect(@cruiser.health).to eq(2)
      @cruiser.hit
      expect(@cruiser.health).to eq(1)
      expect(@cruiser.sunk?).to eq(false)
      @cruiser.hit
      expect(@cruiser.sunk?).to eq(true)
    end
  end
end