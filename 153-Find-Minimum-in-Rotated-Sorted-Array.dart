class Solution {
  int findMin(List<int> nums) {
    int res = nums[0];

    int l=0;
    int r=nums.length-1;
    while(l<=r){

        //We have a sorted portion
        if(nums[l] < nums[r]){
            res = min(nums[l], res);
            return res;
        }


        //Binary division
        int mid = (l+r) ~/2;
        res = min(nums[mid], res);

        //middle is bigger than first element, this portion is big, search the second portion
        if(nums[mid] >= nums[l]){
            l=mid+1;

        //middle is smaller than the beggining, there might be an even smaller value at the first portion
        } else {
            r=mid-1; 
        }
    }

    return res;
  }
}

/*
//Out Of Bounds

class Solution {
  int findMin(List<int> nums) {
    int res = nums[0];

    int l=0;
    int r=nums.length-1;
    while(l<r){
        int mid = (l+r) ~/2;

        //number in the middle is smaller than number at the end, means smaller numbers at the first half
        if(nums[mid] < nums[r]){
            r=mid-1;
            res=min(nums[mid], res); // --> out of bounds here, nums[r-1]
        }

        //number in the middle is bigger than number at the end, means smaller numbers at the second half
        if(nums[mid] > nums[r]){
            l=mid+1;
            res=min(nums[r], res);
        }
    }

    return res;
  }
}
*/

/*
//Brute Force
class Solution {
  int findMin(List<int> nums) {
    int res = nums[0];

    //base case, if list is only one element
    if(nums.length == 1) return res;
    
    
    for(int i=1; i<nums.length; i++){
        //small number afrer big number
        if(nums[i] < nums[i-1]){
            res = nums[i];
            return res;
        
        }
    }

    return res;
  }
}
*/