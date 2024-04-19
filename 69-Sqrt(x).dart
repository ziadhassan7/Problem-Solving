class Solution {
  int mySqrt(int num) {
    int res = 0;

    int l = 1; 
    int r = num;

    while (l <= r) {
        int mid = l + (r - l) ~/ 2; 

        if(mid*mid == num)  return mid;

        if(mid*mid > num) r = mid - 1;

        if(mid*mid < num) {
            l = mid + 1;
            res = mid;
        }
    
    }

    return res;
  }
}