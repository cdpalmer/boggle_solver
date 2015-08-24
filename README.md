# boggle_solver
Code challenge for solving all the words on a boggle board

Using a maze algorithm I heard about once.  Each tile is a node in the maze and you continue in that direction until your word doesn't bring any words from the ditionary (using a fuzzy finder), or you reach the edge of the board.
Typically you don't return any words, then you go back to the previous node (last letter) and go a different direction.  As you go, if you find a word (the fuzzy finder returns only one value), then you add it to the library and keep going.
At some point you'll reach the root node of your search.  At that point you move onto the next tile to start searching.

### Optimizations
- Threading?
- Instead of a Dictionary fuzzy search every new tile, only search what came back on the fuzzy search of the previous tile.  That way only full dictionary searches are on root nodes.
- Linguistic rules (`'i' before 'e' except after 'c'`)
  - Use linguistic rules to ignore dead spots in the board. (i.e. `No word has qx in it`)
