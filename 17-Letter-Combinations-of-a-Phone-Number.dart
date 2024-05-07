class Solution {
  List<String> letterCombinations(String digits) {
    List<String> res = [];
    Map<String, String> phone = {
        \2\: \abc\,
        \3\: \def\,
        \4\: \ghi\,
        \5\: \jkl\,
        \6\: \mno\,
        \7\: \pqrs\,
        \8\: \tuv\,
        \9\: \wxyz\,
    };


    void dfs(int i, String curStr){
        // Base Case: current branch reached the length of our allowed string
        if(curStr.length == digits.length){
            res.add(curStr);
            return;
        }


        //Loop through the character possibilities of digit
        for(String char in phone[digits[i]]){
            //Try another candidate
            dfs(i+1, curStr + char);
        }

    }

    if(digits.isNotEmpty) dfs(0, \\);
    return res;
  }
}