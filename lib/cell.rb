class Cell 

  attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty? 
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if empty? == false
      @ship.hit
    end
  end

  # When render, should return '.' if cell has not been fired upon,
  # 'M' if fire_upon but no ship,
  # 'H' if fire_upon and contains a ship,
  # 'X' if fire_upon and ship is sunk.
  def render(show_ship = false)
    if @fired_upon == false && empty? == false && show_ship == true
      'S'
    elsif @fired_upon == true && empty? == true
      'M'
    elsif @fired_upon == true && empty? == false && @ship.sunk?
      'X'
    elsif @fired_upon == true && empty? == false
      'H'
    elsif @fired_upon == false
      '.'
    end
  end
end
