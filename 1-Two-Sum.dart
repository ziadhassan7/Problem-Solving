class Solution {
    List<int> twoSum(List<int> nums, int target) {

        //create an empty hash map
        Map map = new Map();


        for(int i=0; i<nums.length; i++){
            //get complement value
            int complement = target - nums[i];

            //directly check if the complement exists
            if(map.containsKey(complement)){
                //it exist, return the indexes of two sum
                return [map[complement], i];
            }

            //if the complement wasn't find, add the current number and it's index
            map[nums[i]] = i;
        }
        
        return [];
    }
}


    /*
    Poor Solution:
    for(int i=0; i<nums.length; i++){
        for(int x=i; x<nums.length; x++){
            if(nums[i] + nums[x] == target && i!=x){
                return [i, x];
            }
        }
    }

    return [];*/