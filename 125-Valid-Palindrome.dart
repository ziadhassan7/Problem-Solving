class Solution {
  bool isPalindrome(String s) {
    int l = 0; //pointer at left
    int r = s.length -1; //pointer at right

    //for as long as (l) doesn't meet (r)
    while(r > l){


        //if not alpha-numeric, move extra step -for left pointer-. (loop until you reach a charactar)
        //for each extra step in that small loop, recheck if pointers didn't meet
        while((r > l) && !isAlphaNumic(s[l])){
            l++;
        }

        //if not alpha-numeric, move extra step -for right pointer-. (loop until you reach a charactar)
        //for each extra step in that small loop, recheck if pointers didn't meet
        while((r > l) && !isAlphaNumic(s[r])){
            r--;
        }

        //if charactars didn't match, exit with false
        if(s[l].toLowerCase() != s[r].toLowerCase()){
            return false;
        }

        //move one step
        l++;
        r--;
    }

    return true; //default state
  }

  //check if character is between [A to Z], [a to z], [0 to 9]
  //in other words an alphanumiric character
  bool isAlphaNumic(String c){
    return ((getAscii('A') <= getAscii(c) && getAscii(c) <= getAscii('Z')) 
        || (getAscii('a') <= getAscii(c) && getAscii(c) <= getAscii('z')) 
        || (getAscii('0') <= getAscii(c) && getAscii(c) <= getAscii('9')));
  }

  //get Ascii code
  int getAscii(String c){
    return c.codeUnitAt(0);
  }
}

/*
//Solution 2
class Solution {
  bool isPalindrome(String s) {
    String alphanumericText = '';

    //add only the alphanumeric charactars
    for(String char in s.split('')){
        if(isAlphaNumeric(char)) alphanumericText += char;
    }

    //create proper text, forward and backward
    String textForward = alphanumericText.toLowerCase();
    String textBackward = textForward.split('').reversed.join('');

    //check if palindrome
    return textForward == textBackward;
  }
  
  bool isAlphaNumeric(String s) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(s);
  }
}
*/

/*
//Solution 1

class Solution {
  bool isPalindrome(String s) {
    //remove everything except words. (I we didn't want to remove spaces -> r'[^\\w\\s]+' )
    String fixedString = s.toLowerCase().replaceAll(RegExp(r\[^\\w_]+\), \\).replaceAll(\_\, \\); 
    List fixedStringList = fixedString.split('');

    //text reading forward
    List forwardCharactars = [];
    for(int i=0; i<fixedStringList.length; i++){
        forwardCharactars.add(fixedStringList[i]);
    }

    //text reading backward
    List backwardCharactars = [];
    for(int i=fixedStringList.length-1; i>=0; i--){
        backwardCharactars.add(fixedStringList[i]);
    }
    
    //check if they are the same, if any charactar doesn't match, return false
    for(int i=0; i<forwardCharactars.length; i++){
        if(forwardCharactars[i] != backwardCharactars[i]) return false;
    }

    return true;
  }
}
*/
