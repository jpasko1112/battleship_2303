require 'spec_helper'

RSpec.describe Play do 
  before(:each) do
    @play = Play.new 
    @comp_board = Board.new 
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    @comp_sunk_ships = 0 
    
    @user_board = Board.new 
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_sub = Ship.new("Submarine", 2)
    @user_sunk_ships = 0
  end

  describe '#initialize' do
    it 'initializes game' do 
      expect(@play).to be_a(Play)
    end

    it 'has attributes' do 
      expect(@comp_board).to be_a(Board)
      expect(@comp_cruiser).to be_a(Ship)
      expect(@comp_sub).to be_a(Ship)
      expect(@comp_sunk_ships).to eq(0)
      
      expect(@user_board).to be_a(Board)
      expect(@user_cruiser).to be_a(Ship)
      expect(@user_sub).to be_a(Ship)
      expect(@user_sunk_ships).to eq(0)
    end

    describe 'menu' do
      it 'has a menu' do

      end
    end
  end
end 

