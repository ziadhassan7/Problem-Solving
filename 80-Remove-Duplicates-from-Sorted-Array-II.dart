class Solution {
  int removeDuplicates(List<int> nums) {
    int p = 0;
    int k = 0; //special

    //loop throug the whole list
    while (p<nums.length) {

        //if k hasn't reached 2 -> incremeant, and replace
        //if the third number is a duplicate -> skip and leave (k) here to change it
        //if the third number is not a duplicate -> incremeant, and replace
        if (k<2||nums[p]!=nums[k-2]) {
            nums[k]=nums[p];
            k++;
        }

        p++;
    }

    return k;
  }
}

/*
class Solution {
  int removeDuplicates(List<int> nums) {
    int p = 0; //p1
    int k = 0; //p2 (special)

    while (p < nums.length){
        int count = 1;
        //loop through the special duplicates
        //moving every time we have a duplicate
        //to count duplicates, and move
        while((p+1 < nums.length) && (nums[p] == nums[p+1])){
            //now we have a duplicate
            p++; //incremeant special position
            count++; //incremeant the count of numbers that are duplicate
        }

        //now we don't have any duplicates
        //override the duplicates

        //loop through a maximum of 2, because we can only have 2 duplicates
        //and loop one time, if we don't have a duplicate. (change one number)
        // - Move the special pointer
        for(int i=0; i < min(2, count); i++){
            nums[k] = nums[p];
            k++;
        }

        p++;
    }

    return k;
  }
}
*/
