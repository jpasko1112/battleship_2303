class Cell 

  attr_reader :coordinate, :ship, :empty
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship 
    @empty = true 
  end

  def empty? 
    @empty 
  end
end