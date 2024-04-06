class Solution {
  int maxProfit(List<int> prices) {
    
    int l = 0; //buy (must be before sell - left)
    int r = 1; //sell (must be after buy - right)

    int maxProfit = 0;

    while(r < prices.length){

        //if the new value of r is less than the current l
        if(prices[r] < prices[l]){
            l = r; //jump l to r (where the lowest price)

        //normal case
        } else {
            //compare the old maxprofit with the current one
            maxProfit = max(maxProfit, prices[r] - prices[l]);
        }

        r++;
    }

    return maxProfit;
  }
}