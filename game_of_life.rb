require_relative './lib/board.rb'
require_relative './lib/evolution'
require_relative './lib/display.rb'

initial_board = Board.new(20,80, true)
Display.show(initial_board.state)
puts "Initial board state. Press any button to start the game of life"
gets.chomp
new_bs = Evolution.new(initial_board)

100.times do
  new_bs = Evolution.new(new_bs.board)
  Display.show(new_bs.board.state)
  sleep(0.5)
end



# Display.display(initial_board)
# system "clear"
# exit = false
# until exit == true
#
#   command = gets.strip.upcase
#   system "clear"
#   if command == "X"
#     exit = true
#   end
# end
