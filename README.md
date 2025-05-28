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

bkua_480bd382ddce9f49f9f36757a98170169af13fe0
AKIA3FHJR7O4B2UJ3FHJ
bkua_d130de8752052014f295749c06f00ced3c4f5c3a
another...
bkaa_MTA.Miyf6S3a3g9j8pyBGTyLC1frg9k6gDHTJdL9Fy7FXzRhrAVPckkzK6oEmdQVLvzUjt4rvW7cRPJEu

mo' fake tokens!

bkua_dba72c506d81b88bd5a722fa02233fb3db621fef
