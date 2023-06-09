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
    @cells.key?(coordinate) && !@cells[coordinate].fired_upon?
  end

  def valid_placement?(ship, coordinates)
    coordinates.length == ship.length && consecutive(coordinates) &&
    coordinates.all? { |coordinate| valid_coordinate?(coordinate)} &&
    not_overlapping?(coordinates)
  end

  def place(ship, coordinates)
    coordinates.map do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

def render(show_ship = false)
  if show_ship == false 
    "  1 2 3 4 \n" +
    "A " "#{@cells["A1"].render} " + "#{@cells["A2"].render} " + "#{@cells["A3"].render} " + "#{@cells["A4"].render} \n" +
    "B " "#{@cells["B1"].render} " + "#{@cells["B2"].render} " + "#{@cells["B3"].render} " + "#{@cells["B4"].render} \n" +
    "C " "#{@cells["C1"].render} " + "#{@cells["C2"].render} " + "#{@cells["C3"].render} " + "#{@cells["C4"].render} \n" +
    "D " "#{@cells["D1"].render} " + "#{@cells["D2"].render} " + "#{@cells["D3"].render} " + "#{@cells["D4"].render} \n" 
  elsif show_ship == true 

    "  1 2 3 4 \n" +
    "A " "#{@cells["A1"].render(true)} " + "#{@cells["A2"].render(true)} " + "#{@cells["A3"].render(true)} " + "#{@cells["A4"].render(true)} \n" +
    "B " "#{@cells["B1"].render(true)} " + "#{@cells["B2"].render(true)} " + "#{@cells["B3"].render(true)} " + "#{@cells["B4"].render(true)} \n" +
    "C " "#{@cells["C1"].render(true)} " + "#{@cells["C2"].render(true)} " + "#{@cells["C3"].render(true)} " + "#{@cells["C4"].render(true)} \n" +
    "D " "#{@cells["D1"].render(true)} " + "#{@cells["D2"].render(true)} " + "#{@cells["D3"].render(true)} " + "#{@cells["D4"].render(true)} \n" 
  end 
end 
  # ---helper methods---

  def consecutive(coordinates)
    (same_letter?(coordinates) && horizontal?(coordinates)) || 
    (same_number?(coordinates) && vertical?(coordinates))
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