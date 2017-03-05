#lib/cell.rb
class Cell
  attr_reader :state
  def initialize
    @state = 'dead'
  end

  def toggle
    @state = @state == 'dead' ? 'alive' : 'dead'
  end
end
