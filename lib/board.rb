class Board 
  attr_reader :cells 

  def initialize
    @cells = {        
    "A1" => Cell.new("A1"),
    "A2" => Cell.new("A2"), 
    "A3" => Cell.new("A3"), 
    "A4" => Cell.new("A4"), 
    "B1" => Cell.new("B1"), 
    "B2" => Cell.new("B2"), 
    "B3" => Cell.new("B3"),
    "B4" => Cell.new("B4"), 
    "C1" => Cell.new("C1"),
    "C2" => Cell.new("C2"), 
    "C3" => Cell.new("C3"), 
    "C4" => Cell.new("C4"), 
    "D1" => Cell.new("D1"), 
    "D2" => Cell.new("D2"), 
    "D3" => Cell.new("D3"), 
    "D4" => Cell.new("D4") 
    }
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    coordinates.length == ship.length && consecutive(coordinates) && not_overlapping?(coordinates)
  end

  def place(ship, coordinates)
    coordinates.map do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  # assigning a ship to cells at given coordinates
  def place(ship,coordinates) 
    # if valid_placement?(ship, coordinates) && valid_coordinate?(coordinates)
    # @cells.cell.place_ship(ship)
    # else 
    #   "Those are invalid coordinates. Please try again:"
    # end
  end

  # ---helper methods---

  def consecutive(coordinates)
    (same_letter?(coordinates) && horizontal?(coordinates)) || (same_number?(coordinates) && vertical?(coordinates))
  end 

  def same_number?(coordinates)
    coordinates.map do |coordinate|
      coordinate[1]
    end.uniq.count == 1
  end

  def same_letter?(coordinates)
    coordinates.map do |coordinate|
      coordinate[0]
    end.uniq.count == 1 
  end

  def vertical?(coordinates)
    cord_ltrs = coordinates.map do |coordinate|
      coordinate[0] 
    end
    range = cord_ltrs.first..cord_ltrs.last
    cord_ltrs == range.to_a
  end

  def horizontal?(coordinates)
    cord_nums = coordinates.map do |coordinate|
      coordinate[1] 
    end
    range = cord_nums.first..cord_nums.last
    cord_nums == range.to_a
  end

  def not_overlapping?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty? 
    end
  end
end