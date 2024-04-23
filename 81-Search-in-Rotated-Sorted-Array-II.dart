class Solution {
  bool search(List<int> nums, int target) {
    

    int l=0;
    int r=nums.length-1;
    while(l<=r){
        int mid= (l+r) ~/2;

        //FOUND
        if(nums[mid] == target) return true;
        //if mid is the same as the start, move window by 1 step
        if(nums[mid] == nums[l]) l++;

        //BINARY SEARCH
        //First Portion
        else if(nums[mid] > nums[l]){
            //nums[l] < target < nums[mid] - in range
            if(nums[l] <= target && target < nums[mid]) {
                r=mid-1;

            } else {
                l=mid+1;
            }

        //Second Portion
        } else {
            //nums[mid] < target < nums[r] - in range
            if(nums[mid] < target && target <= nums[r]){
                l=mid+1;

            } else {
                r=mid-1;
            }
        }
        
    }

    return false;
  }
}