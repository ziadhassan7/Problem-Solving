class Solution {
  bool exist(List<List<String>> board, String word) {
    int rows = board.length;
    int columns = board[0].length;
    Set<String> path = {};

    bool dfs(int r, int c, int i) {
        // Base Case: we formed our word :)
        if (i == word.length) return true;
        
        // NOT GOOD
        // We are -Out of Boundries-
        if(r < 0 || c < 0   ||   r >= rows || c >= columns) return false;
        // We came across a wrong char -Wrong Path-
        if(board[r][c] != word[i]) return false;
        // We've visited this path before!!
        if(path.contains('$r,$c')) return false;


        path.add('$r,$c'); //save current position
        bool res = dfs(r + 1, c, i + 1) ||
                dfs(r - 1, c, i + 1) ||
                dfs(r, c + 1, i + 1) ||
                dfs(r, c - 1, i + 1);
        path.remove('$r,$c'); //backtrack
        return res;
    }


    //Try every position, and run dfs
    for (int r = 0; r < rows; r++) {
        for (int c = 0; c < columns; c++) {
            if (dfs(r, c, 0)) return true;
        }
    }

    return false;
  }
}