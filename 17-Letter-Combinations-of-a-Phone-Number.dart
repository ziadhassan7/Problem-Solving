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


        // Get character possibilities of this digit
        String currentDigit = digits[i];
        String chars = phone[currentDigit]!;

        //Loop through the character possibilities of digit
        for(int x=0; x<chars.length; x++){
            //Try another candidate
            dfs(i+1, curStr + chars[x]);
        }

    }

    if(digits.isNotEmpty) dfs(0, \\);
    return res;
  }
}


/*
//My Approach: IT WORKS :)

class Solution {
  List<String> letterCombinations(String digits) {
    Map<String, List<String>> phone = {
        \2\: [\a\, \b\, \c\],
        \3\: [\d\, \e\, \f\],
        \4\: [\g\, \h\, \i\],
        \5\: [\j\, \k\, \l\],
        \6\: [\m\, \n\, \o\],
        \7\: [\p\, \q\, \r\, \s\],
        \8\: [\t\, \u\, \v\],
        \9\: [\w\, \x\, \y\, \z\],
    };

    List<String> res = [];

    List<String> comb = [];
    void dfs(int i){
        // Base Case: current branch reached the length of our allowed string
        if(i >= digits.length){
            res.add(comb.join(\\));
            return;
        }

        // Get character possibilities of this digit
        String currentDigit = digits[i];
        List<String> chars = phone[currentDigit]!;

        //Loop through the character possibilities of digit
        for(int x=0; x<chars.length; x++){
            //Add char
            comb.add(chars[x]);
            //Try another candidate
            dfs(i+1);
            //Remove Char -BackTrack-
            comb.removeLast();
        }

    }

    if(digits.isNotEmpty) dfs(0);
    return res;
  }
}
*/

/*
//Using a string: Does Not Work :(

class Solution {
  List<String> letterCombinations(String digits) {
    Map<String, List<String>> phone = {
        \2\: [\a\, \b\, \c\],
        \3\: [\d\, \e\, \f\],
        \4\: [\g\, \h\, \i\],
        \5\: [\j\, \k\, \l\],
        \6\: [\m\, \n\, \o\],
        \7\: [\p\, \q\, \r\, \s\],
        \8\: [\t\, \u\, \v\],
        \9\: [\w\, \x\, \y\, \z\],
    };

    List<String> res = [];

    String comb = '';
    void dfs(int i){
        // Base Case: current branch reached the length of our allowed string
        if(i >= digits.length){
            res.add(comb);
            return;
        }

        // Get character possibilities of this digit
        String currentDigit = digits[i];
        List<String> chars = phone[currentDigit]!;

        //Loop through the character possibilities of digit
        for(int x=0; x<chars.length; x++){
            //Add char
            comb = comb + chars[x];
            //Try another candidate
            dfs(i+1);
            //Remove Char -BackTrack-
            comb.substring(0, comb.length - 1);
        }

    }

    dfs(0);
    return res;
  }
}
*/
