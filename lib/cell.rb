class Cell 

  attr_reader :coordinate, :ship, :empty
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true 
  end

  def empty? 
    if @ship = ship 
      !@empty
    else
      @empty
    end 
  end

  def place_ship(ship)
    @ship = ship
  end
end