class Solution {
    bool isPerfectSquare(int num) {
        if (num <= 1) { // Handle base cases (1 is a perfect square)
            return true;
        }

        int l = 1; 
        int r = num;

        while (l <= r) {
            int mid = l + (r - l) ~/ 2; 

            if(mid*mid == num)  return true;

            if(mid*mid > num) r = mid - 1;

            if(mid*mid < num) l = mid + 1;
        
        }

        return false;
    }
}