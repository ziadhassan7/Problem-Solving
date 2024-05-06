class Solution {
  List<List<int>> combine(int n, int k) {
    List<List<int>> res = [];

    List<int> comb = [];
    void backtrack(int start){
        if(comb.length == k){ //Base Case : you want to check if you reached the length of K.
            res.add(List.from(comb));
            return;
        }

        for(int i=start; i<n; i++){ //start from our start point to avoid using the same numbers all over again (i=0 is wrong) //discover all numbers till n (not k)
            comb.add(i+1);
            backtrack(i+1);
            comb.removeLast();
        }
    }

    backtrack(0);
    return res;
  }
}

/*
//Simpler Format

class Solution {
  List<List<int>> combine(int n, int k) {
    List<List<int>> res = [];

    void backtrack(int start, List<int> comb) {
        if (comb.length == k) {
            res.add(List.from(comb));
            return;
        }

        for (int i = start; i <= n; i++) {
            comb.add(i);
            backtrack(i + 1, comb);
            comb.removeLast();
        }
    }

    backtrack(1, []);
    return res;
  }
}
*/