class Solution {
  int removeDuplicates(List<int> nums) {
    int p = 1; //p1
    int k = 1; //p2 (specials counter)

    while (p < nums.length){
        //if it is not special
        if(nums[p] != nums[p-1]){
            nums[k] = nums[p];
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
    List<int> specials = []; 
    int p = 0; //p1
    int k = 0; //p2 (specials counter)

    //Loop through the list, adding and counting only the special characters
    while (p < nums.length){
        //if it is unique, add it
        if(!specials.contains(nums[p])){
            specials.add(nums[p]);
            k++;
        }
        p++;
    }

    //loop again through the list, to edit the old list with the specials list
    for (int i=0; i<k; i++){
        //if list in bound with specials list
        if(i<k){
            //edit items one at a time
            nums[i] = specials[i];
        }
    }

    return k;
  }
}
*/