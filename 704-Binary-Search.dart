//Using loops
class Solution {
  int search(List<int> nums, int target) {

    int l = 0;
    int r = nums.length-1;

    while(l<=r){
        int mid = ((l+r)/2).floor();

        if(nums[mid] == target){
            return mid;
        }

        if(nums[mid] > target){
            r = mid-1;
        }

        if(nums[mid] < target){
            l = mid+1;
        }
    }

    return -1;
  }
}


/*
//Using Recursion
class Solution {
  int search(List<int> nums, int target) {

    int binarySearch(int start, int end) {
      if (start > end) {
        return -1; // target not found (empty search space)
      }

      int mid = (start + end) ~/ 2; //get the mid index, ~/ works for even and odd lists
      
      if (nums[mid] > target) {
        return binarySearch(start, mid - 1); // search left half
      } 
      
      else if (nums[mid] < target){
        return binarySearch(mid + 1, end); // search right half
      }

      else { //nums[mid] == target
        return mid; // target found
      } 
    }

    return binarySearch(0, nums.length - 1);
  }
}
*/