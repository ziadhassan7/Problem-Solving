class Solution {
  bool isAnagram(String s, String t) {
    //convert string into list
    List words1 = s.split('');
    List words2 = t.split('');
    
    //sort list
    words1.sort((a, b) => a.compareTo(b));
    words2.sort((a, b) => a.compareTo(b));
    
    //check if duplicate  
    return isDuplicate(words1, words2);
  }

    
    bool isDuplicate(List words1, List words2){

        //if length is not equall => exit
        if(words1.length != words2.length) return false;

        //if every charachter and the one it's facing, is not equal => exit
        for(int i=0; i < words1.length; i++){
            if(!(words1[i] == words2[i])){
                return false;
            }
        }
    
        //duplicate
        return true;
    }
}