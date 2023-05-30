class Play 
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

  def menu 
    sleep(1.0)
    puts "Welcome to BATTLESHIP!\n"
    sleep(1.0)
    puts "Who's reporting for duty? (ENTER NAME)"
    name = gets.chomp.capitalize
    sleep(1.0)
    puts "#{name} prepare for BATTLE!" 
    sleep(1.0)
    puts "Enter p to play.\n"
    sleep(1.0)
    puts "Enter q to quit."
    input = gets.chomp 
    if input == "p"
      sleep(1.0)
      puts "Man your Battle Stations!!"
    elsif input == "q"
      sleep(1.0)
      puts "Abandon Ship!!"
      menu 
    else 
      sleep(1.0)
      puts "Misfire. Choose another option."
      menu
    end
  end

end