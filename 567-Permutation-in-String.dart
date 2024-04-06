/*
//Time: O(s1.length + 26 + (s2.length - s1.length)) => O(s2.length) => O(n)
//Space: O(26) => O(1)
//1-  (s1.length) => initial window
//2-  (26) => iteration to count the initial matches
//3-  (s2.length - s1.length) => (Sliding Window)


//The letter code minus the letter 'a' code
s1.codeUnitAt(i) - 'a'.codeUnitAt(0)

If we have for example the character 'e'
Then 'e' - 'a' = 1s01 - 97 = 4
 => (4) is the position of the letter 'e' in the alphabet
*/
class Solution {
  bool checkInclusion(String s1, String s2) {
     if (s1.length > s2.length) {
      return false;
    }

    //map a list for each s1,s2
    //filled for the 26 chars
    List<int> s1map = List<int>.filled(26, 0, growable: false);
    List<int> s2map = List<int>.filled(26, 0, growable: false);

    //The initial window and its matching characters
    for (var i = 0; i < s1.length; i++) {
      s1map[s1.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
      s2map[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]++; //(letter index) => (incremeant 1)
    }


    //count the initial matches between the two lists
    int matches = 0;
    for(int i=0; i < 26; i++){
        matches += (s1map[i] == s2map[i])? 1: 0;
    }
    

    int r = 0;
    int l = 0;
    while (r < (s2.length - s1.length)) {
        //if the two lists matches => return true
        if (matches == 26) return true;


        //Sliding window
        //position of the character (that entered the window)
        int charIndex = s2.codeUnitAt(r + s1.length) - 'a'.codeUnitAt(0);
        s2map[charIndex]++; //incremeant the count of that character

        //incremeant the count of, if the characters matches
        if(s1map[charIndex] == s2map[charIndex]){
            //if the character count is now equal that character count in the s2 list
            //You have found a match!!!
            matches++;
        } else if (s1map[charIndex]+1 == s2map[charIndex]){
            //the current count of the character (but plus 1) is equal the count in s2 list
            //Means it was a match but now it's not!! :(
            matches--;
        }
        //we didn't directly use else (because the third case is that it was already not equal 
        //so we shouldn't miss with the count every time we loop through it)



        //position of the character (that left)
        charIndex = s2.codeUnitAt(l) - 'a'.codeUnitAt(0);
        s2map[charIndex]--; //removed a character from the window (decremeant the count of that char)

        //maybe by decremeanting the count of a char, it made it equal!
        if(s1map[charIndex] == s2map[charIndex]){
            matches++;
        //it was equal, but now the count is smaller by 1
        } else if (s1map[charIndex]-1 == s2map[charIndex]){
            matches--;
        }

        r++;
        l++;
    }

    return matches == 26;
  }
}






/*
//Time: O(s1.length + 26(s2.length - s1.length)) => O(26 * s2.length) => O(26n) => O(n)

class Solution {
  bool checkInclusion(String s1, String s2) {
    if (s1.length > s2.length) {
      return false;
    }

    //map a list for each s1,s2
    //filled for the 26 chars
    List<int> s1map = List<int>.filled(26, 0, growable: false);
    List<int> s2map = List<int>.filled(26, 0, growable: false);

    //The initial window and its matching characters
    for (var i = 0; i < s1.length; i++) {
      s1map[s1.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
      s2map[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]++; //(letter index) => (incremeant 1)
    }

    
    
    for (var i = 0; i < (s2.length - s1.length); i++) {
    //if the two lists matches => return true
      if (matches(s1map, s2map)) {
        return true;
      }

      //Sliding window
      //incremeant (1) to the charachter at (the end of the window)
      //decremeant (1) to the charachter at (the charactar that left the window - the begining -)
      s2map[s2.codeUnitAt(i + s1.length) - 'a'.codeUnitAt(0)]++;
      s2map[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]--;
    }

    return matches(s1map, s2map);
  }

  bool matches(List<int> s1map, List<int> s2map) {
    //if any char didn't match in the list => return false
    for (int i = 0; i < 26; i++) {
      if (s1map[i] != s2map[i]) {
        return false;
      }
    }

    //all chars matched => true
    return true;
  }
}
*/


/*
//Time Limit Exceeded
class Solution {
    bool checkInclusion(String s1, String s2) {
        s1 = sort(s1);
        //s2 = sort(s2); do not do that because you do not want to miss with the arrangment of the big text


        int r = s1.length -1; //pointer (for a window of the length of s1)
        int l = 0;
    
        while(r< s2.length){

            //compare s1 with a sorted part of s2 (substring needs +1 to take the whole part)
            if(s1 == sort(s2.substring(l, r+1))){
                return true;
            }

            r++;
            l++;
        }

        return false;
    }
    
    
    String sort(String str){
        //sort list of charachters
        final s = str.split('');
        s.sort();

        //re-join list of charachters into a String word
        return s.join();
    }
}
*/