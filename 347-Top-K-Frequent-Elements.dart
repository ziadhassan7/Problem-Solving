class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    Map<int, int> map = {};

    //key: number, value: frequency
    nums.forEach((number){
        //if key exist, increment
        if(map.containsKey(number)) map[number] = map[number]! + 1;
        //if not, add 1 to the key
        else map[number] = 1;
    });

    return getMostFreguent(map, k);
  }

  List<int> getMostFreguent(Map<int, int> map, int k){

    //sort map by value, Descending order
    Map<int, int> mapSortedByValue = Map.fromEntries(
    map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));

    //empty list, to hold values
    List<int> topFrequent = [];
    
    //iterate by the k
    //get the most frequent: [first key, second key]

    return [ for(int i=0; i<k; i++) mapSortedByValue.keys.elementAt(i) ];
  }
}