require_relative './lib/board.rb'
require_relative './lib/evolution'
require_relative './lib/display.rb'

initial_board = Board.new(20, 80, true)
Display.show(initial_board.state)
puts "Initial board state. Press any button to start the game of life"
gets.chomp

new_bs = Evolution.new(initial_board)

while true do
  new_bs = Evolution.new(new_bs.board)
  Display.show(new_bs.board.state)
  sleep(0.5)
end

def mass_assignment(coordinates)
  ggg = Board.new(20, 80, false)
  coordinates.each do |coords|
    ggg.set_coordinate_value(coords[0], coords[1], true)
  end
  ggg
end

ggg_coordinates = [[5,1],[6,1],[5,2],[6,2],[3,14],[3,13],[4,12],[5,11],[6,11],[7,11],[8,12],[9,13],[9,14],[8,16],[7,17],[6,15],[6,17],[6,18],[5,17],[4,16],[3,21],[4,21],[5,21],[3,22],[4,22],[5,22],[2,23],[6,23],[1,25],[2,25],[6,25],[7,25],[3,35],[4,35],[3,36],[4,36]]
ggg = mass_assignment(ggg_coordinates)
Display.show(ggg.state)
gets.chomp

new_bs = Evolution.new(ggg)
while true do
  new_bs = Evolution.new(new_bs.board)
  Display.show(new_bs.board.state)
  sleep(0.1)
end
