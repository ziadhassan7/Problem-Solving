/*
//Just another style of writing 

class Solution {
  int maxVowels(String s, int k) {
    Set vowls = {'a', 'e', 'i', 'o', 'u'};

    int count = 0;
    int maxCount = 0;

    //Sliding Window
    int l=0;
    for(int r=0; r< s.length; r++){

        //for the first k elements , just add elements without removing any
        //and then, start moving the window
        
        if(r<k){
            //add element
            if(vowls.contains(s[r])){
                count++; maxCount++;
            }

        } else {
            //add element
            if(vowls.contains(s[r])) count++;

            //remove element
            if(vowls.contains(s[l++])) count--;
        }


        //count the biggest substring we got
        maxCount = max(maxCount, count);
    }

    return maxCount;
  }
}
*/


class Solution {
  int maxVowels(String s, int k) {
    Set vowls = {'a', 'e', 'i', 'o', 'u'};

    int count = 0;
    int maxCount = 0;

    //Initial Window
    for(int i=0; i<k; i++){
        if(vowls.contains(s[i])){
            count++; maxCount++;
        } 
    }

    //Sliding Window
    int l=0;
    for(int r=k; r< s.length; r++){

        //add element
        if(vowls.contains(s[r])) count++;

        //remove element
        if(vowls.contains(s[l])) count--;
        l++;

        //count the biggest substring we got
        maxCount = max(maxCount, count);
    }

    return maxCount;
  }
}
