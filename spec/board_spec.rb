require 'board'

describe Board do
  before(:all) do
    @board = Board.new
    @random_row = rand(0..19)
    @random_column = rand(0..79)
  end

  describe 'new board' do
    it 'should have 20 rows' do
      expect(@board.state.length).to eql 20
    end
    it 'should have 80 columns in each row' do
      expect(@board.state[0].length).to eql 80
    end
    it 'should be filled with cells' do
      sample = @board.state[@random_row][@random_column]
      expect(sample).to eql false
    end
  end

  describe 'should correctly report location' do
    it 'with a valid location' do
      expect(@board.location(@random_row, @random_column)).to eq @board.state[@random_row][@random_column]
    end
    it 'with nil for an invalid location' do
      expect(@board.location(-1, 100)).to eq nil
    end
  end

  describe 'should report cell neighbours' do
    it 'with an array of 3 for a corner cell' do
      result = @board.neighbours(0, 0)
      expect(result.length).to eq 3
    end
    it 'with an array of 8 neighbours for an inner cell' do
      result = @board.neighbours(3, 3)
      expect(result.length).to eq 8
    end
    it 'with correct array content for corner cell' do
      board = Board.new(5, 5, true)
      manual_result = []
      manual_result << board.location(0, 1) << board.location(1, 1) << board.location(1,0)
      result = board.neighbours(0, 0)
      expect(result).to eq manual_result
    end
    it 'with correct array content for inner cell' do
      board = Board.new(5, 5, true)
      manual_result = []
      manual_result << board.location(2, 1) << board.location(1, 1) << board.location(1, 2) << board.location(1, 3) << board.location(2, 3) << board.location(3, 3) << board.location(3, 2) << board.location(3, 1)
      result = board.neighbours(2, 2)
      expect(result).to eq manual_result
    end
  end
end
