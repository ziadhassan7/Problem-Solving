//O(n)
//The difference is
//We are directly  adding/removing to the list
//We do not re-compute all the elements of the window (using pointers / and a string)
//Rather than that, we are truly using the sliding window technique 

class Solution {
    List<int> findAnagrams(String s, String p) {
        List<int> ans = [];

        if (s.length < p.length) return ans;

        List<int> pChar = List<int>.filled(26, 0, growable: false);
        List<int> window = List<int>.filled(26, 0, growable: false);


        //P charachters count - Initial Window count 
        for (var i = 0; i < p.length; i++) {
            pChar[p[i].codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
            window[s[i].codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
        }
        //For the first match, add it
        if (matches(pChar, window)) {
            ans.add(0);
        }


        //Sliding Window

        //we start after the initial window
        for (var i = p.length; i < s.length; i++) {
            //remove first element, starting from 0
            window[s[i - p.length].codeUnitAt(0) - \a\.codeUnitAt(0)]--;
            //add element after initial window
            window[s[i].codeUnitAt(0) - \a\.codeUnitAt(0)]++;

            if (matches(pChar, window)) {
                ans.add(i - p.length + 1); //+1 becuase we start adding after 0
            }
        }

        return ans;
    }


  bool matches(List<int> firstMap, List<int> secondMap) {
    for (int i = 0; i < 26; i++) {
      if (firstMap[i] != secondMap[i]) {
        return false;
      }
    }
    return true;
  }
}

/*
//Time Limit Exceeded
//O((n - m) * m) => O(n*m)
//Because for each window (n-m) we compare with p (m)

//The problem with this solution is that you count the number of occurances for each window,
//and by doing that, you hadn't benefit from using a window in the first place.

//Avoid Recalculating Character Occurrences, and update the occurrences as you slide the window!

class Solution{
    List<int> findAnagrams(String s, String p) {
        List<int> result = [];
        if(p.length > s.length) return result;

        Map<String, int> pCharMap = getCharOccurences(p);


        //Sliding Window
        String window = s.substring(0, p.length);

        //compare initial window
        if(mapsAreEqual(getCharOccurences(window), pCharMap)) result.add(0);

        int l = 0; 
        while (l < (s.length - p.length)){

            window+= s[l+p.length]; //add char
            window = window.substring(1); //remove first char

            //Compare window with a map
            if(mapsAreEqual(getCharOccurences(window), pCharMap)) result.add(l+1);

            l++;
        }
        
        return result;
    }

    //get a map with the number of occurences of each char
    Map<String, int> getCharOccurences(String str) {
        Map<String, int> charCount = {};
        for (int i = 0; i < str.length; i++) {
            String char = str[i];
            //to the current char, get the default value ('??' if it doesn't exist, return 0), then add 1 to it
            charCount[char] = (charCount[char] ?? 0) + 1;
        }
        return charCount;
    }
    

    bool mapsAreEqual(Map<String, int> map1, Map<String, int> map2) {
        if (map1.length != map2.length) return false;

        for (var key in map1.keys) {
            if (map1[key] != map2[key]) return false;
        }
        return true;
    }
}
*/

/*
//You shouldn't use sorting because who said, p is even sorted??
//So now you might be comparing a sorted s with a non sorted p

class Solution{
  List<int> findAnagrams(String s, String p) {
    List<int> result = [];

    if(p.length > s.length) return result;

    int l = 0; //start of the window

    String window = s.substring(l, l+p.length);

    //initial window
    if(p == sort(window)){
        result.add(l);
    }


    while (l < (s.length - p.length)){

        window+= s[l+p.length]; //add char
        window = window.substring(1); //remove first char

        if(p == sort(window)){
            result.add(l+1);
        }

        l++;
    }
    
    return result;
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