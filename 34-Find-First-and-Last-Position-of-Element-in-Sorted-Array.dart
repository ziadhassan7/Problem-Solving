//Tweaked Approach

//Find the mid
//make start and end both positioned on mid
//as long as you're still on target, move start backward
//as long as you're still on target, move end forward


class Solution {
  List<int> searchRange(List<int> nums, int target) {
    int l=0;
    int r=nums.length-1;


    while(l<=r){
        int mid=(l+r) ~/2;

        if(nums[mid] == target){
            r=mid;
            l=mid;

            while((r+1 <= nums.length-1) && (nums[r+1] == target)){
                r++;
            }

            while((l-1 >= 0) && (nums[l-1] == target)){
                l--;
            }

            return [l,r];
        }

        if(nums[mid] > target) r=mid-1;
        if(nums[mid] < target) l=mid+1;
    }

    return [-1,-1];
  }
}

/*
//Find the mid, then move the start and end (till it finds the target)

class Solution {
  List<int> searchRange(List<int> nums, int target) {
    int l=0;
    int r=nums.length-1;

    while(l<=r){
        int mid=(l+r) ~/2;

        if(nums[mid] == target){

            while(nums[l] < target){
                l++;
            }

            while(nums[r] > target){
                r--;
            }

            return [l,r];

        }

        if(nums[mid] > target) r=mid-1;
        if(nums[mid] < target) l=mid+1;
    }

    return [-1,-1];
  }
}
*/