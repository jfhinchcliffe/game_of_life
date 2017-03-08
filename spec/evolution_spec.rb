require 'evolution'
require 'board'

describe Evolution do
  before(:all) do
    @board = Board.new(5, 5, true)
    @evolution = Evolution.new(@board)
  end

  describe 'new evolution' do
    it 'should produce a different board than the initial board' do
      expect(@evolution.board.state).not_to eql @board.state
    end
    it 'should correctly evolve 3 times for the blinker pattern' do
      # O O O O O    O O O O O
      # O O X O O    O O O O O
      # O O X O O to O X X X O
      # O O X O O    O O O O O
      # O O O O O    O O O O O

      test_board_start_state = Board.new(5, 5, false)
      test_board_end_state = Board.new(5, 5, false)
      # Setting test_board_start_state to 'blinker' pattern
      test_board_start_state.set_coordinate_value(1, 2, true)
      test_board_start_state.set_coordinate_value(2, 2, true)
      test_board_start_state.set_coordinate_value(3, 2, true)
      # Setting test_board_end_state end state to next step of 'blinker'
      test_board_end_state.set_coordinate_value(2, 1, true)
      test_board_end_state.set_coordinate_value(2, 2, true)
      test_board_end_state.set_coordinate_value(2, 3, true)
      # Running through 3 evolutions
      evolution_one = Evolution.new(test_board_start_state)
      evolution_two = Evolution.new(evolution_one.board)
      evolution_three = Evolution.new(evolution_two.board)
      expect(evolution_three.board.state).to eql test_board_end_state.state
    end
    it 'should should stay static as a 2 x 2 square' do
      # O O O O O    O O O O O
      # O X X O O    O X X O O
      # O X X O O to O X X O O
      # O O O O O    O O O O O
      # O O O O O    O O O O O

      test_board_start_state = Board.new(5, 5, false)
      test_board_end_state = Board.new(5, 5, false)
      # Setting test_board_start_state to static square pattern
      test_board_start_state.set_coordinate_value(1, 1, true)
      test_board_start_state.set_coordinate_value(1, 2, true)
      test_board_start_state.set_coordinate_value(2, 1, true)
      test_board_start_state.set_coordinate_value(2, 2, true)
      # Setting test_board_end_state to the same values
      test_board_end_state.set_coordinate_value(1, 1, true)
      test_board_end_state.set_coordinate_value(1, 2, true)
      test_board_end_state.set_coordinate_value(2, 1, true)
      test_board_end_state.set_coordinate_value(2, 2, true)
      # Running through an evolution
      evolution_one = Evolution.new(test_board_start_state)
      expect(evolution_one.board.state).to eql test_board_end_state.state
    end
    it 'should correctly evolve from a 3 x 3 square to a star' do
      # O O O O O     O O X O O
      # O X X X O     O X O X O
      # O X X X O to  X O O O X
      # O X X X O     O X O X O
      # O O O O O     O O X O O

      test_board_start_state = Board.new(5, 5, false)
      test_board_end_state = Board.new(5, 5, false)
      # Setting test_board_start_state to a 3 x 3 square
      test_board_start_state.set_coordinate_value(1, 1, true)
      test_board_start_state.set_coordinate_value(1, 2, true)
      test_board_start_state.set_coordinate_value(1, 3, true)
      test_board_start_state.set_coordinate_value(2, 1, true)
      test_board_start_state.set_coordinate_value(2, 2, true)
      test_board_start_state.set_coordinate_value(2, 3, true)
      test_board_start_state.set_coordinate_value(3, 1, true)
      test_board_start_state.set_coordinate_value(3, 2, true)
      test_board_start_state.set_coordinate_value(3, 3, true)
      # Setting test_board_end_state end state to next step of the square
      test_board_end_state.set_coordinate_value(0, 2, true)
      test_board_end_state.set_coordinate_value(1, 1, true)
      test_board_end_state.set_coordinate_value(1, 3, true)
      test_board_end_state.set_coordinate_value(2, 0, true)
      test_board_end_state.set_coordinate_value(2, 4, true)
      test_board_end_state.set_coordinate_value(3, 1, true)
      test_board_end_state.set_coordinate_value(3, 3, true)
      test_board_end_state.set_coordinate_value(4, 2, true)
      evolution_one = Evolution.new(test_board_start_state)
      expect(evolution_one.board.state).to eql test_board_end_state.state
    end
  end
end
