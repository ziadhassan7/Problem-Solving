class Solution {
  bool makesquare(List<int> matchsticks) {
    int sideLength = matchsticks.fold(0, (sum, stick) => sum + stick) ~/ 4;
    List<int> sides = List.filled(4, 0);

    //if sum %4 != 0   => (sum of all sticks / 4) should equall an int number
    if (matchsticks.fold(0, (sum, stick) => sum + stick) % 4 != 0) {
      return false;
    }

    //Sort => To check the largest first to see if it exceeds 
    matchsticks.sort((a, b) => b.compareTo(a));


    bool dfs(int i) {
        // Base Case
        if (i == matchsticks.length) {
            return true;
        }

        // iterate for each 4 sides
        for (int j = 0; j < 4; j++) {

            // get (length of this side) + current match ===> check if doesn't exceed sideLength
            if (sides[j] + matchsticks[i] <= sideLength) {
                sides[j] += matchsticks[i]; //add match to side
                if (dfs(i + 1)) return true;
                sides[j] -= matchsticks[i]; //backtrack
            }
        }

        return false;
    }

    return dfs(0);
  }
}

