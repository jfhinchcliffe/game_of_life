require_relative './board'
# Class/ Evolution
class Evolution
  attr_reader :board
  def initialize(board)
    @board = tick(board)
  end

  def tick(original_board)
    # Create a board the same size as the incoming board
    evolved_board = Board.new(original_board.state.length, original_board.state[0].length)
    new_generation(original_board, evolved_board)
  end

  def new_generation(original_board, evolved_board)
    original_board.state.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        # Find neighbours of current cell locaiton
        neighbours = original_board.neighbours(row_index, cell_index)
        # Find the neighbours that return true / are live
        neighbour_live_count = neighbours.select { |value| value == true }.length
        # Apply the rules to the current cell location, based on neighbours
        evolved_cell_value = apply_rules(cell, neighbour_live_count)
        # Set current board coordinate to the result of the applied rules
        evolved_board.set_coordinate_value(row_index, cell_index, evolved_cell_value)
      end
    end
    evolved_board
  end

  def apply_rules(cell, neighbour_live_count)
    # All of Conway's rules.
    evolved_cell_value = cell
    if cell == false && neighbour_live_count == 3
      evolved_cell_value = true
    elsif cell == true && neighbour_live_count < 2
      evolved_cell_value = false
    elsif cell == true && neighbour_live_count > 3
      evolved_cell_value = false
    elsif cell == true
      evolved_cell_value = true
    end
    evolved_cell_value
  end
end
