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
end
