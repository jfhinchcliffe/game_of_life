require 'evolution'
require 'board'

describe Evolution do
  before(:all) do
    board = Board.new(5,10)
    @evolution = Evolution.new(board)
  end

  describe 'new evolution' do
    it 'should evolve with each tick' do
      expect(@evolution.tick).to eql 'hi'
    end
    # it 'should have 80 columns in each row' do
    #   expect(@board.state[0].length).to eql 80
    # end
    # it 'should be filled with cells' do
    #   sample = @board.state[@random_row][@random_column]
    #   expect(sample).to be_an_instance_of(Cell)
    # end
  end
end
