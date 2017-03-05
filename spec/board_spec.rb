require 'board'

describe Board do
  before(:all) do
    @board = Board.new
  end

  describe 'new board' do
    it 'should have 20 rows' do
      expect(@board.state.length).to eql 20
    end
    it 'should have 80 columns in each row' do
      expect(@board.state[0].length).to eql 80
    end
    it 'should be filled with cells' do
      row = rand(0..20)
      column = rand(0..80)
      sample = @board.state[row][column]
      expect(sample).to be_an_instance_of(Cell)
    end
  end
end
