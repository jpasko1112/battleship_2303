class GameLogic

  def welcome_message
    puts "                                      |__
                        |\/
                        ---
                        /  | [
                        |  |||
                    _/|     _/|-++'
                    +  +--|    |--|--|_ |-
                    { /|__|  |/\__|  |--- |||__/
                    +---------------___[}-_===_.'____               /\    
                  ____`-' ||___-{]_| _[}-  |     |_[___\==--          \/   _
      __..._____--==/___]_|__|_____________________________[___\==--___,-----' .7
      |                                                                   BB-61/
      \_______________________________________________________________________|
"
sleep(0.5)
puts "██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗        ████████╗ ██████╗         ██████╗  █████╗ ████████╗████████╗██╗     ███████╗███████╗██╗  ██╗██╗██████╗     ██╗    ██╗
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝        ╚══██╔══╝██╔═══██╗        ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔════╝██║  ██║██║██╔══██╗    ██║    ██║
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗             ██║   ██║   ██║        ██████╔╝███████║   ██║      ██║   ██║     █████╗  ███████╗███████║██║██████╔╝    ██║    ██║
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝             ██║   ██║   ██║        ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ╚════██║██╔══██║██║██╔═══╝     ╚═╝    ╚═╝
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗           ██║   ╚██████╔╝        ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗███████║██║  ██║██║██║         ██╗    ██╗
╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝           ╚═╝    ╚═════╝         ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝         ╚═╝    ╚═╝
                                                                                                                                                        \n"
sleep(1.0)

  end

  def user_input
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

  def comp_sub_placement
    valid_sub_coordinates = @comp_board.cells.keys.sample(2)
    until @comp_board.valid_placement?(@comp_sub, valid_sub_coordinates) == true 
      valid_sub_coordinates = @comp_board.cells.keys.sample(2)
    end
    @comp_board.place(@comp_sub, valid_sub_coordinates)
  end

  def comp_cruiser_placement
    valid_cruiser_coordinates = @comp_board.cells.keys.sample(3)
    until @comp_board.valid_placement?(@comp_cruiser, valid_cruiser_coordinates) == true 
      valid_cruiser_coordinates = @comp_board.cells.keys.sample(3)
    end
    @comp_board.place(@comp_cruiser, valid_cruiser_coordinates)
  end

  def comp_ship_placement_message
    puts @comp_board.render
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
  end

  def user_cruiser_placement 
    puts "Enter squares for your Cruiser (3 spaces):"
    user_cruiser_input = gets.chomp.upcase.split 
    if @user_board.valid_placement?(@user_cruiser, user_cruiser_input) == true 
      @user_board.place(@user_cruiser, user_cruiser_input)
    else
      puts "Those are invalid coordinates. Please try again."
      user_cruiser_placement 
    end
  end 

  def user_sub_placement 
    puts "Enter squares for your Submarine (2 spaces):"
    user_sub_input = gets.chomp.upcase.split 
    if @user_board.valid_placement?(@user_sub, user_sub_input) == true 
      @user_board.place(@user_sub, user_sub_input)
    else
      puts "Those are invalid coordinates. Please try again."
      user_sub_placement 
    end
  end

  def turn
    puts @comp_board.render
    puts @user_board.render(true)
    puts "Enter the coordinate for your shot:"
    user_choice = gets.chomp.upcase
    if @comp_board.valid_coordinate?(user_choice)
      @comp_board.cells[user_choice].fire_upon
      user_result = @comp_board.cells[user_choice].render
      @comp_sunk_ships += 1 if user_result == "X"
    else
      puts "Please enter a valid coordinate."
      turn
    end
    comp_choice = @user_board.cells.keys.sample(1).join
    until @user_board.cells[comp_choice].fired_upon? == false
      comp_choice = @user_board.cells.keys.sample(1).join
    end
    @user_board.cells[comp_choice].fire_upon
    comp_result = @user_board.cells[comp_choice].render(true)
    if comp_result == "X"
      @user_sunk_ships += 1
    end
    puts "Your shot on #{user_choice} was a #{user_result}."
    puts "My shot on #{comp_choice} was a #{comp_result}."
    game_over?
  end
end