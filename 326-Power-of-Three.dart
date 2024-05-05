// (~/) => Ignores the decimal, same as toInt()


//Using Recursion

class Solution {
  bool isPowerOfThree(int n) {
    //Base case: non-positive numbers are not powers of 3
    if (n <= 0) return false;


    bool checkNumber(int n){
        // Base case: when we reach (1)
        if(n == 1) return true;

        // Not divisible by 3, cannot be a power of 3
        if(n % 3 != 0) return false;

        return checkNumber((n / 3).toInt());
    }

    return checkNumber(n);
  }
}


/*
//Using Loop

class Solution {
  bool isPowerOfThree(int n) {
    //Base case: non-positive numbers are not powers of 3
    if (n <= 0) return false;

    //loop till we reach (1)
    while (n > 1) {
        // Not divisible by 3, cannot be a power of 3
        if (n % 3 != 0) return false;
        
        n = n ~/ 3; //cut by 3, then check if we are still good (and repeat)
    }
    return true;
  }
}
*/