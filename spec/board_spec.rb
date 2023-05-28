require 'spec_helper'

RSpec.describe Board do 
  before(:each) do
    @board = Board.new 
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cell_1 = @board.cells['A1']
    @cell_2 = @board.cells['A2']
    @cell_3 = @board.cells['A3']
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
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells['A1']).to be_a(Cell)
      expect(@board.cells['A2']).to be_a(Cell)
      expect(@board.cells['A3']).to be_a(Cell)
      expect(@board.cells['A4']).to be_a(Cell)
      expect(@board.cells['B1']).to be_a(Cell)
      expect(@board.cells['B2']).to be_a(Cell)
      expect(@board.cells['B3']).to be_a(Cell)
      expect(@board.cells['B4']).to be_a(Cell)
      expect(@board.cells['C1']).to be_a(Cell)
      expect(@board.cells['C2']).to be_a(Cell)
      expect(@board.cells['C3']).to be_a(Cell)
      expect(@board.cells['C4']).to be_a(Cell)
      expect(@board.cells['D1']).to be_a(Cell)
      expect(@board.cells['D2']).to be_a(Cell)
      expect(@board.cells['D3']).to be_a(Cell)
      expect(@board.cells['D4']).to be_a(Cell)
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
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)

      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A3", "A4"])).to eq(true)
    end

    it 'checks if coordinates are consecutive' do
      expect(@board.valid_placement?(@cruiser, ['A1', 'A2', 'A4'])).to eq(false)
      expect(@board.valid_placement?(@submarine, ['A1', 'C1'])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ['A3', 'A2', 'A1'])).to eq(false)
      expect(@board.valid_placement?(@submarine, ['C1', 'B1'])).to eq(false)
    end

    it 'can check if placement is not diagonal' do 
      expect(@board.valid_placement?(@cruiser, ['A1', 'B2', 'C3'])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end
  end

  describe '#place(ship, [coordinates])' do
    it 'can place a ship on given coordinates' do
      @board.place(@cruiser, ['A1', 'A2', 'A3'])
      expect(@cell_1).to eq(@board.cells['A1'])
      expect(@cell_2).to eq(@board.cells['A2'])
      expect(@cell_3).to eq(@board.cells['A3'])
      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_2.ship).to eq(@cruiser)
      expect(@cell_3.ship).to eq(@cruiser)
      expect(@cell_3.ship == @cell_2.ship).to eq(true)
    end
  end



# ---HELPER METHODS TEST---



  describe '#same_number?' do
    it 'can check for duplicate coordinate numbers' do 
      expect(@board.same_number?(["A2", "A3", "A4"])).to eq(false)
      expect(@board.same_number?(["A2", "B2", "C2"])).to eq(true)
    end
  end 

  describe '#same_letter?' do
    it 'can check for duplicate coordinate letters' do 
      expect(@board.same_letter?(["A2", "A3", "A4"])).to eq(true)
      expect(@board.same_letter?(["A2", "B2", "C2"])).to eq(false)
    end
  end 

  describe '#same_letter?' do
    it 'can check for duplicate coordinate letters' do 
      expect(@board.same_letter?(["A2", "A3", "A4"])).to eq(true)
      expect(@board.same_letter?(["A2", "B2", "C2"])).to eq(false)
    end
  end 

  describe '#vertical?' do
    it 'can check if coordinates are vertical' do 
      expect(@board.vertical?(["A1", "A2", "A3"])).to eq(false)
      expect(@board.vertical?(["A1", "B1", "C1"])).to eq(true)
    end
  end

  describe '#horizontal?' do
    it 'can check if coordinates are horizontal' do
      expect(@board.horizontal?(["A1", "A2", "A3"])).to eq(true)
      expect(@board.horizontal?(["A1", "B1", "C1"])).to eq(false)
    end
  end

  describe '#overlapping?' do
    it 'checks if coordinates are overlapping' do 
      expect(@board.overlapping?(["C4", "D4"])).to eq(true)
    end
  end
end