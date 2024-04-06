class Solution {
  bool containsDuplicate(List<int> nums) {
    //Optimal Solution
    //return nums.toSet().length != nums.length;

    Set hashSet = Set();

    for(int number in nums){
        //if exist, return
        if(hashSet.contains(number)) return true;

        //if not, save it as a temp to check later
        hashSet.add(number);
    }

    return false;
  }
}