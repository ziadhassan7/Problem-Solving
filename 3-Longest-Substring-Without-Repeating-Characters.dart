class Solution {
  int lengthOfLongestSubstring(String s) {
    Set<String> chars = {};

    int maxLength = 0;

    //Sliding Window
    int l=0;
    for(int r=0; r<s.length; r++){
        //as long as there is a duplicate
        while(chars.contains(s[r])){
            //remove last element, and move the window forward
            chars.remove(s[l]);
            l++;
        }

        //add a new element to the window
        chars.add(s[r]);
        //compare the current length, with the length of the current index - the moved elements +1
        //we say +1, because (r) is an index not the number of elements
        maxLength = max(maxLength, r-l +1);
    }

    return maxLength;
  }
}