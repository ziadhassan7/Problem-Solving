class Solution {
  List<List<int>> threeSum(List<int> nums) {
    List<List<int>> res = [];

    //Sort the arrays to avoid duplicates
    nums.sort();

    //First loop for getting the first value
    for(int i=0; i<nums.length - 1; i++){
        //Avoid duplicates
        if(i != 0 && nums[i] == nums[i-1]){
            continue; //continue to the next iteration, if it's a duplicate
        }

        /// Using the Two Sum II technique 
        int f = i + 1; //forward pointer (start after first value)
        int b = nums.length - 1; //backward pointer

        while (f < b){
            int threeSum = nums[i] + nums[f] + nums[b];

            if(threeSum > 0){
                b--;

            } else if(threeSum < 0){
                f++;

            //Total Sum is (0)!! :)
            } else {
                res.add([nums[i], nums[f], nums[b]]);

                //find another sum companation for the first value
                f++;
                while( f<b && nums[f] == nums[f-1]){ //make sure no duplicates, and in bounds
                    f++;
                }
            }
        }
    }

    //return the list
    return res;
  }
}