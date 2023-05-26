class Cell 

  attr_reader :coordinate, :ship, :empty, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true 
    @fired_upon = false
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

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    @ship.hit
  end
end