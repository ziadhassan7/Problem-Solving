class Solution {
  List<List<int>> fourSum(List<int> nums, int target) {
    nums.sort();
    List<List<int>> res = [];
    List<int> quad = [];

    kSum(nums, target, 4, 0, quad, res);
    return res;
  }

  void kSum(List<int> nums, int target, int k, int start, List<int> quad, List<List<int>> res) {
    if (k == 2) {
        twoSum(nums, target, start, quad, res);

    } else {
        calculateBeforeTwoSum(nums, target, k, start, quad, res);
    }

    
  }

  calculateBeforeTwoSum(List<int> nums, int target, int k, int start, List<int> quad, List<List<int>> res){
    //in this for loop we start from the next element
    //and with each new loop we increase the posibilties to loop through (by decreasing k)
    for (int i = start; i <= nums.length - k; i++) {
        //Skip, if it is not the first index (i > start), and it is a duplicate!!
        if (i > start && nums[i] == nums[i - 1]) continue;

        //We add each element, and explore combinations.
        //After exploring a combination (whole list)
        //We remove the last element added, to backtrack and explore another combination.

        //add current number from the loop to discover it
        quad.add(nums[i]);

        kSum(
            nums,
            target - nums[i], //remove the number that we've took from the current sum (new target)
            k - 1, //degrease k
            i + 1, //start from the next index, to avoid using the same element again
            quad, res);

        //backtrack to discover alternative (This will run after reaching the Two Sum method)
        quad.removeLast();
    }
  }

  void twoSum(List<int> nums, int target, int start, List<int> quad, List<List<int>> res) {
    int l = start; //forward (left)
    int r = nums.length - 1; //backward (right)


    while (l < r) {
        if (nums[l] + nums[r] < target) {
            l++;
        } else if (nums[l] + nums[r] > target) {
            r--;
        } else {
            //add all the quad elements + the elements from the Two Sum II method
            res.add([...quad, nums[l], nums[r]]);

            //continue a step forward, (to find a new compination + the quads)
            l++;

            //skip for duplicates
            while (l < r && nums[l] == nums[l - 1]) {
                l++;
            }
        }
    }
  }
}
