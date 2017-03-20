# lib/board.rb
class Board
  attr_reader :state
  def initialize(rows = 20, columns = 80, random = false)
    @state = set_board(rows, columns, random)
  end

  def set_board(rows, columns, random)
    Array.new(rows) { Array.new(columns) {random ? random_value() : false}}
  end

  def random_value
    [true, false].sample
  end

  def set_coordinate_value(row, column, value)
    @state[row][column] = value
  end

  def location(row, column)
    @state[row][column]
  end

  def neighbours(row, column)
    # Need to make sure that the cells we're looking for don't go out of bounds
    # or it will wrap around and return the wrong array element.
    # Also... this is ugly! Need to refactor
    neighbours = []

    get_neighbour_coordinates(row, column).each do |element|
      row = element[0]
      column = element[1]
      neighbours << @state[row][column] if in_bounds(row, column)
    end
    neighbours
  end

  def get_neighbour_coordinates(row, column)
    #Creates a grid of the coordinate neighbours
    [
      [row,     column - 1],
      [row - 1, column - 1],
      [row - 1, column],
      [row - 1, column + 1],
      [row,     column + 1],
      [row + 1, column + 1],
      [row + 1, column],
      [row + 1, column - 1]
    ]
  end

  def in_bounds(row, column)
    # Checking if the row and column are within the length
    # and height restrictions  of board
    if row.between?(0, @state.length - 1) && column.between?(0, @state[0].length - 1)
      return true
    else
      return false
    end
  end
end
