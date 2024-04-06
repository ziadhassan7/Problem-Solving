class Solution {
  bool containsNearbyDuplicate(List<int> nums, int k) {
    Set<int> window = {};
    int l = 0; //last element

    for(int r=0; r < nums.length; r++){

        //the gap is bigger than k
        if(r - l > k){
            //remove the last element
            window.remove(nums[l]);
            //leave the last pointer behind
            l++; 
        }

        //contains a duplicate!!
        if(window.contains(nums[r])){
            return true;
        }

        //every loop we add the new element
        window.add(nums[r]);
    }

    return false;
  }
}

/*
class Solution {
  bool containsNearbyDuplicate(List<int> nums, int k) {
        //hashmap
        final map = <int, int>{};

        //loop through the whole list
        for (int i = 0; i < nums.length; i++) {

            //check if the number exists
            if (map.containsKey(nums[i])) {

                //check if, (new index - last index) is less than k
                //(To check if we are IN THE gap)
                if (i - map[nums[i]]! <= k) {
                    return true;
                }
            }

            map[nums[i]] = i;
        }

        return false;
    }
}
*/
