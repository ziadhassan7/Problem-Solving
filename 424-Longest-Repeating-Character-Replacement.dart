class Solution {
  int characterReplacement(String s, int k) {
    Map<String, int> map = {}; //we have a hashmap to store characters with its occurances

    //The count of -the most freq char- at any given time
    int maxf = 0;
    int res = 0;

    //Sliding Window
    int l=0;
    for (int r=0; r < s.length; r++) {
        //Get the current char
        String char = s[r];
        //increase the freq of that char
        map[char] = (map[char] ?? 0) + 1;
        //Let's check if we got a new max freq of chars
        maxf = max(maxf, map[char]!);

        //if (the size of the window) - the max freq   > k
        //(r-l) the window index, (+1) for the length
        if ((r - l + 1) - maxf > k) {
            //Now that we passed our rule,
            //move the window, and decreament the count of the furthest char (that left) 
            map[s[l]] = map[s[l]]! - 1;
            l++;
        }

        //return the maximum window length
        res = max(res, r - l + 1);
    }

    
    return res; 
  }
}