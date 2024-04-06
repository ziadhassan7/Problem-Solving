class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    Map<String,List<String>> map={};

    //loop through each word
    strs.forEach((str){

        //sort list of charachters
        final s = str.split('');
        s.sort();

        //re-join list of charachters into a String word
        final key=s.join();

        //check if map has a key (arranged word), get the list assigned to the key, and add a new word to it
        if(map.containsKey(key)) map[key]!.add(str);

        //if not, assign a new [value]. 
        //it's a new list of a single word, assigned to that key. the key is an arranged word.
        else map[key]=[str];
    });

    //convert map to list
    return map.values.toList();
  }
}