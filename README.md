# GameOfLife

Code challenge for junior position at Marketplacer

Evolution rules:
- Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by overpopulation.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

Challenge can be found here: https://gist.github.com/mipearson/572ee773572b9b7f9372c6f98feb3bfc

## Notes / Improvements
- Need to possibly mock Cell in board_spec when checking for the class.
- neighbours method in board looks super ugly. Look for a better way.
- The Neighbours method in Board needs refactoring - super ugly.
- Having a Cell class seemed unnecessary - board state just needs to have T/F for each section.
