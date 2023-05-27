require 'spec_helper'

RSpec.describe Board do 
  before(:each) do
    @board = Board.new 
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe '#initialize' do 
    it "initializes board" do 
      expect(@board).to be_a(Board)
      expect(@cruiser).to be_a(Ship)
      expect(@submarine).to be_a(Ship)
    end
  end

  describe '#cells' do
    it 'can hold cells' do 
      expect(@board.cells).to be_a(Hash)({
        "A1" => Cell.new,
        "A2" => Cell.new, 
        "A3" => Cell.new, 
        "A4" => Cell.new, 
        "B1" => Cell.new, 
        "B2" => Cell.new, 
        "B3" => Cell.new,
        "B4" => Cell.new, 
        "C1" => Cell.new,
        "C2" => Cell.new, 
        "C3" => Cell.new, 
        "C4" => Cell.new, 
        "D1" => Cell.new, 
        "D2" => Cell.new, 
        "D3" => Cell.new, 
        "D4" => Cell.new 
      })
    end
  end

  describe '#valid_coordinate?' do
    it 'can validate a given coordinate' do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
      expect(@board.valid_coordinate?("A7")).to eq(false)
      expect(@board.valid_coordinate?("E5")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
      expect(@board.valid_coordinate?("C2")).to eq(true)
    end
  end

  describe '#valid_placement? Length & consecutive' do
    it 'can check if placement is valid: ship length, consecutive' do 
      expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)

      expect (@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(@board.valid_placement?(submarine, ["A3", "A4"])).to eq(true)
    end
  end

  describe '#valid_placement? Diagonal' do 
    it 'can check if placement is valid: ship length, diagonal' do 
      expect(@board.valid_placement(@submarine, ["C2", "D3"])).to eq(false)
      expect(@board.valid_placement(@submarine, ["D2", "D3"])).to eq(true)

      expect(@board.valid_placement(@submarine, ["C2", "D3"])).to eq(false)
      expect(@board.valid_placement(@submarine, ["C2", "C3"])).to eq(true)
    end
  end
end