class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    int f = 0; //forward
    int b = numbers.length - 1; //backward

    //numbers are sorted
    while(f < numbers.length){

        //if it's bigger than the target, then we need to decrease from the bigger side of numbers (right - b)
        if(numbers[f] + numbers[b] > target){
            b--;
        
        //if it's less than the target, then we need to increase from the smaller side of numbers (left - f)
        } else if(numbers[f] + numbers[b] < target){
            f++;
        
        //if equal, return
        } else {
            return [f+1, b+1];
        }
    }

    return [f+1, b+1];
  }
}