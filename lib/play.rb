class Play 
    attr_reader :menu, :user_sunk_ships, :comp_sunk_ships 
  def initialize 
    @menu = menu 
    @user_sunk_ships = 0
    @comp_sunk_ships = 0
  end
end