# GameOfLife

Code challenge for junior dev position
March, 2017
By Jason Hinchcliffe

## Instructions
- Unzip files
- Navigate to root directory
- Run `ruby game_of_life.rb` in terminal
- Press ctrl-c to exit the infinite loop

## Evolution rules:
- Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by overpopulation.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

Challenge can be found here: [https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

## Notes / Improvements
- The Neighbours method in Board needs refactoring - super ugly.
- Having a Cell class seemed unnecessary - board state just needs to have true / false for each section.
- In the Evolution test I'm requiring Board. Need to figure out how to test Evolution in isolation.
- Display isn't tested - not sure how to test text output to terminal.

bkua_f1941f1340c508eda2cc3fe8b3c3397a698ef956
