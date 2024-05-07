class Solution {
  List<List<String>> partition(String s) {
    List<List<String>> res=[];

    List<String> part = [];
    void dfs(int i){
        //Base Case: We finished the string
        if(i >= s.length){
            res.add(List.from(part));
            return;
        }

        //Loop: every time, increase one char to the portion
        for(int j=i; j<s.length; j++){
            if(isPali(s, i, j)){
                part.add(s.substring(i, j+1));
                dfs(j+1);
                part.removeLast();
            }
        }
    }

    dfs(0);
    return res;
  }

  //Check If this portion is a Palidrom
  //in the string s, Start from i, Till j.
  bool isPali(String s, int l, int r){
    while (l<r){
        if(s[l] != s[r]) return false;

        l++; r--;
    }
    return true;
  }
}