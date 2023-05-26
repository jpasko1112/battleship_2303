require 'spec_helper'

RSpec.describe Ship do
  before(:each) do
    @ship = Ship.new('Cruiser', 3)
  end

  describe '#initialize' do
    it 'can initalize' do
      expect(@ship).to be_a(Ship)
    end

    it 'initializes with a name' do
      expect(@ship.name).to eq('Cruiser')
    end

    it 'initializes with a length' do
      expect(@ship.length).to eq(3)
    end
  end
end