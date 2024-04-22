//Better Explanation 
class Solution {
  int search(List<int> nums, int target) {

    int l=0;
    int r=nums.length-1;
    while(l<=r){
        int mid = (l+r) ~/2;

        if(nums[mid] == target){
            return mid;
        }

        //mid is bigger than start, 
        //we are in the first portion (big numbers)
        if(nums[mid] >= nums[l]){
            //nums[l] < target < nums[mid] ==> then the target is in the first portion (our current portion)
            if(nums[l] <= target && target < nums[mid]) {
                r=mid-1;

            //else => second portion (other portion)
            } else {
                l=mid+1;
            }

        //mid is smaller than start, 
        //we are in the second portion (small numbers)
        } else {
            //nums[mid] < target < nums[r] ==> then the target is in the second portion (our current portion)
            if(nums[mid] < target && target <= nums[r]){
                l=mid+1;

            //else, the other portion
            } else {
                r=mid-1;
            }
        }
    }

    return -1;
  }
}

/*
class Solution {
  int search(List<int> nums, int target) {

    int l=0;
    int r=nums.length-1;
    while(l<=r){
        int mid = (l+r) ~/2;

        if(nums[mid] == target){
            return mid;
        }

        //mid is bigger than start, 
        //we are in the first portion (big numbers)
        if(nums[mid] >= nums[l]){
            //target is bigger than middle (after middle). => search second portion
            //target is smaller than start of the first portion (smaller than big numnbers). => search second portion
            if(target > nums[mid] || target < nums[l]) {
                l=mid+1;

            //else => first portion
            } else {
                r=mid-1;
            }

        //mid is smaller than start, 
        //we are in the second portion (small numbers)
        } else {
            //if target is bigger than end => second portion ends without containing this big number
            //if target is smaller than middle => the possibilty that middle isn't the first element in smaller numbers
            if(target < nums[mid] || target > nums[r]){
                r=mid-1;

            } else {
                l=mid+1;
            }

            /* Don't
            //if target is bigger than middle => discover the first portion
            //----> Can't do that becuase 
            //----> [5,(1),3] target=3
            //----> [6,7,0,(1),2,4,5] target=7
            //
            //----> target > mid, in both cases 
            
            if(target > nums[mid]){
                r=mid-1;

            } else {
                l=mid+1;
            }
            */
        }
    }

    return -1;
  }
}
*/

/*
//Not a good approach

class Solution {
  int search(List<int> nums, int target) {
    int index = 0;
    
    int l=0;
    int r=nums.length-1;
    while(l<=r){
        int mid = (l+r) ~/2;

        if(nums[mid] == target){
            return mid;
        }

        //target is bigger than mid and the end, it is in the first portion
        //OR target is less than mid, but bigger than end
        if((target > nums[mid] && target > nums[r]) 
            || (target < nums[mid] && target > nums[r])){

                r=mid-1;
                index=mid;

        } else {
            l=mid+1;
            index=mid;
        }
    }

    return index;
  }
}
*/