require 'board'
# Class/ Evolution
class Evolution
  attr_reader :board
  def initialize(board)
    @board = randomise_state(board)
  end

  def randomise_state(board)
    board.state.each do |row|
      row.each do |column|
        column.toggle if flip_a_coin?
      end
    end
    board
  end

  def flip_a_coin?
    [true, false].sample
  end

  def tick
    evolved_board = Board.new(5, 10)
    row_number = 0
    @board.state.each do |row|
      puts "ROW"
      column_number = 0
      row.each do |column|

        current_cell = @board.location(row_number, column_number)
        neighbours = @board.neighbours(row_number, column_number)
        living_neighbours = neighbours.select{|cell| cell.state == 'alive'}.length
        set_value = apply_rules(living_neighbours)
        puts 'set value'
        puts set_value
        evolved_board.set_coordinate(row_number, column_number, set_value)
        column_number += 1
      end
      puts 'inc row number'
      row_number += 1
    end
    puts 'evolved board'
    puts 'Board'
    display(@board)
    puts 'evolved_board'
    display(evolved_board)
  end

  def apply_rules(living_neighbours)
    puts 'living neighbours'
    puts living_neighbours
    cell = ''
    if living_neighbours < 2
      cell = 'dead'
    elsif living_neighbours > 3
      cell = 'dead'
    elsif living_neighbours == 3
      cell = 'alive'
    end
    puts "value is #{cell}"
    cell
  end

  def display(board)
    board.state.each do |row|
      row.each do |cell|
        print cell.state == 'dead' ? 'O' : 'X'
      end
      puts "\n"
    end
  end

end
