require 'cell'

describe Cell do
  before(:all) do
    @cell = Cell.new
  end

  describe 'new' do
    it 'defaults to dead' do
      expect(@cell.state).to eql 'dead'
    end
  end
  describe 'toggle' do
    it 'toggles from dead to alive' do
      @cell.toggle
      expect(@cell.state).to eql 'alive'
    end
    it 'toggles from alive to dead' do 
      @cell.toggle
      expect(@cell.state).to eql 'dead'
    end
  end
end
