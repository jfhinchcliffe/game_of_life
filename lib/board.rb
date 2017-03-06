require 'cell'
# lib/board.rb
class Board
  attr_reader :state
  def initialize(rows = 20, columns = 80)
    @state = set_board(rows, columns)
  end

  def set_board(rows, columns)
    board = []
    rows.times do
      board << create_row(columns)
    end
    board
  end

  def create_row(columns)
    row = []
    columns.times do
      row << Cell.new
    end
    row
  end

  def location(row, column)
    @state[row][column]
  end

  def neighbours(row, column)
    # Need to make sure that the cells we're looking for don't go out of bounds,
    # or it will wrap around and return the wrong array element.
    # Also... this is ugly! Need to refactor
    neighbours = []
    neighbours << @state[row][column -1] if in_bounds(row, column - 1)
    neighbours << @state[row - 1][column -1] if in_bounds(row - 1, column - 1)
    neighbours << @state[row - 1][column] if in_bounds(row - 1, column)
    neighbours << @state[row - 1][column + 1] if in_bounds(row - 1, column + 1)
    neighbours << @state[row][column + 1] if in_bounds(row, column + 1)
    neighbours << @state[row + 1][column + 1] if in_bounds(row + 1, column + 1)
    neighbours << @state[row + 1][column] if in_bounds(row + 1, column)
    neighbours << @state[row + 1][column -1] if in_bounds(row + 1, column -1)
    neighbours
  end

  def in_bounds(row, column)
    if row.between?(0, @state.length - 1) && column.between?(0, @state[0].length - 1)
      return true
    else
      return false
    end
  end

end
