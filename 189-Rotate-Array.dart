class Solution {
    void rotate(List<int> nums, int k) {
        //audit the k
        //
        k %= nums.length;

        reverseNum(nums, 0, nums.length-1); //reverse the whole list
        reverseNum(nums, 0, k-1); //reverse the until the k portion of the array (reversed back)
        reverseNum(nums, k, nums.length-1); //reverse the remaining portion of the array (reversed back)
    }

    //reverse elements
    void reverseNum(List<int> nums, int start, int end) {
        //loop until start meet the end
        while(start < end) {
            //hold temporarily value
            int temp = nums[start];
            //start swapped with end
            nums[start] = nums[end];
            nums[end] = temp;

            //move start forward and end backward
            start++;
            end--;
        }
    }
}

/*
//Time Limit Exceeded
class Solution {
  void rotate(List<int> nums, int k) {
    List<int> temp = List<int>.filled(nums.length, 0);

    //loop throug each value
    for(int i =0; i < nums.length; i++){
        if(i+k < nums.length){
            //add in temp with a position moved by the number of k
            temp[i+k] = nums[i];

        } else {
            //now add the values but backward
            temp[(i+k) - (nums.length)] = nums[i]; 
            //temp[(i+k)%nums.length] = nums[i]; //The modulo operator % returns the remainder of the division (i+k) by nums.length.
        }
    }

    //nums = temp
    for(int i =0; i < nums.length; i++){
        nums[i] = temp[i];
    }
  }
}
*/

