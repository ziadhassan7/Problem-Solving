class Solution {
  List<String> restoreIpAddresses(String s) {
        List<String> res = [];

        //If we have a string more than 12 digits, we will not get a correct IP Address from it (Some Digits will remain unused)
        if (s.length > 12) {
            return res;
        }


        //=> keep track of current digit
        //   & how many dots we used
        //   & current IP Address we have
        void backtrack(int start, int dots, String curIP) {
            // Base Case: We finished our current compination 
            // (used 4 dots, used all string)
            if (dots == 4 && start == s.length) {
                res.add(curIP.substring(0, curIP.length - 1));
                return;
            }

            // This is not valid (we can only have 4 dots) => return
            if (dots > 4) {
                return;
            }

            
            // Loop from the current start point to the next 2 digit
            // avoid going out of bounds => min(next 2  and  len(s))
            for (int j = start; j < min(start + 3, s.length); j++) {

                int num = int.parse(s.substring(start, j + 1)); //start point to the range we explored

                //only allowed 0:255
                //no leading 0 unless start is j (same number)
                if (num <= 255 && (start == j || s[start] != '0')) {
                    backtrack(j + 1, dots + 1, '$curIP$num.'); //next start point , next dot , add new explored num + our current IP
                }
            }
        }

        backtrack(0, 0, '');
        return res;
  }
}

