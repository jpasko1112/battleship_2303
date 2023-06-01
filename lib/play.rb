require_relative './game_logic'
class Play < GameLogic
    attr_reader :comp_board, :comp_sunk_ships, :comp_cruiser, 
                :comp_sub, :user_board, :user_sunk_ships,
                :user_cruiser, :user_sub
            
  def initialize 
    @comp_board = Board.new 
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    @comp_sunk_ships = 0 
    
    @user_board = Board.new 
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_sub = Ship.new("Submarine", 2)
    @user_sunk_ships = 0
  end

  def play_game 
    welcome_message
    user_input
    comp_fleet_placement
    user_fleet_placement
    turn
    game_over?
    new_game
  end

  def comp_fleet_placement 
    comp_sub_placement 
    comp_cruiser_placement 
    comp_ship_placement_message
  end

  def user_fleet_placement
    user_cruiser_placement
    user_sub_placement
  end

  def game_over?
    if @user_sunk_ships == 2
      puts "You can't defeat me you poor excuse for a Sailor!"
      self.play_game
    elsif
      @comp_sunk_ships == 2
      puts "I am not a worthy Sailor, for I am but a computer!"
      self.play_game
    else
      turn
    end
  end
end
