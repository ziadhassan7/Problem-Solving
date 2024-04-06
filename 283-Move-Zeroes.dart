class Solution {
  void moveZeroes(List<int> nums) {
        int nonZeroIndex = 0; //pointer 1

        //loop through the list (pointer 2)
        for (int p=0; p<nums.length; p++){
            //if you meet a non zero element, SWAP with the last zero
            if(nums[p] != 0){
                //hold a temp value for swapping
                int temp = nums[nonZeroIndex];

                //override old index with correct element (correct it with a non zero element)
                nums[nonZeroIndex] = nums[p];
                nonZeroIndex++;

                nums[p] = temp; //old element swapped 
            }
        }
        
    }
}


/*
class Solution {
  void moveZeroes(List<int> nums) {

    int zerosCounter = 0;
    int p = 0; //pointer for edited list

    //first loop to move numbers to the beginning of list
    for(int i=0; i<nums.length; i++){
        if(nums[i] != 0){
            //edit list with current pointer
            nums[p] = nums[i];
            p++;
        } else {
            //increase zeros counter
            zerosCounter++;
        }
    }

    //loop by the number of zeros, and add them at (the end of where we left of: p)
    for(int i=0; i<zerosCounter; i++){
        nums[p] = 0;
        p++;
    }

  }
}
*/