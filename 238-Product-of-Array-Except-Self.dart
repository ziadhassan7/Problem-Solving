class Solution {
    List<int> productExceptSelf(List<int> nums) {
        //make a list, with default values 1
        List<int> products = List<int>.filled(nums.length, 1);

        //--Prefix
        //temp value: default 1
        int temp = 1;

        //loop through numbers
        for(int i=0;i<nums.length;i++) {
            //add current temp value to list
            products[i] = temp;
            //new temp (multiply last value with current number)
            temp *= nums[i];
        }

        //--Postfix
        //reset temp
        temp = 1;

        //loop through numbers, backwards
        for(int i=nums.length-1; i>=0; i--) {
            //multiply current list value with last saved temp
            products[i] *= temp;
            //new temp (multiply last saved temp with current number)
            temp *= nums[i]; 
        }

        return products;
    }
}

/*
//Exceed time limit

class Solution {
  List<int> productExceptSelf(List<int> nums) {
    return [
        for(int i=0; i<nums.length; i++) getProductExcept(nums, i)
    ];
  }

  int getProductExcept(List nums, int exeptionIndex){
    int productExceptSelf = 1;

    for(int i=0; i<nums.length; i++) {
        if(i != exeptionIndex) productExceptSelf = productExceptSelf * (nums[i] as int);
    } 

    return productExceptSelf;
  }
}
*/