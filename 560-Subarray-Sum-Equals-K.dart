//You can have negative values
//how many arrays can sum to k?

class Solution {
  int subarraySum(List<int> nums, int k) {
    int sum = 0;
    int result = 0;

    Map<int, int> map = {0: 1}; // Initialize with 0:1 to handle sum-k = 0

    for (var i = 0; i < nums.length; i++) {
      sum += nums[i]; //add the current number to the cumulative sum

      // Check if there is a subarray with sum (currentSum - k)
      if (map.containsKey(sum - k)) {
        result += map[sum - k]!;
      }

      //update the sum frequency map
      map[sum] = (map[sum] ?? 0) + 1;
    }

    return result;
  }
}