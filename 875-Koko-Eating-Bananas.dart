class Solution {
  int minEatingSpeed(List<int> piles, int h) {
    int minK=1;
    int maxK=getTheMostBananas(piles);

    int res = maxK;

    while(minK<=maxK){
        int mid = (minK+maxK) ~/2;
        //get current time of eating banans
        int hrs = 0;
        for(int num in piles){
            hrs += (num/mid).ceil();
        }

        //Binary Search
        if(hrs <= h) {
            maxK=mid-1;
            res = min(res, mid);
        }
        if(hrs > h) {
            minK=mid+1;
        }
    }

    return res;
  }

  getTheMostBananas(List<int> piles){
    int max = 1;
    for(int num in piles){
        max = num > max ? num : max;
    }
    return max;
  }
}



/*
//Brute Force

class Solution {
  int minEatingSpeed(List<int> piles, int h) {

    int k=1;

    while(k<getTheMostBananas(piles)){
        //get current time of eating banans
        int hrs = 0;
        for(int num in piles){
            hrs += (num/k).ceil();
        }

        //if equal or less than time allowed, return
        if(hrs <= h) return k;

        //if not, continue loop
        k++;
    }

    return k;
  }

  getTheMostBananas(List<int> piles){
    int max = 1;
    for(int num in piles){
        max = num > max ? num : max;
    }
    return max;
  }
}
*/