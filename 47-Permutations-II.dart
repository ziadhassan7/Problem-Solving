class Solution {
  List<List<int>> permuteUnique(List<int> nums) {
    List<List<int>> res = [];
    List<int> perm = [];
    Map<int, int> count = {};

    //Fill the count map with nums and occurances
    for (int n in nums) {
        count[n] = (count[n] ?? 0) + 1;
    }


    void dfs() {
        // Base Case:
        if (perm.length == nums.length) {
            res.add(List.from(perm));
            return;
        }

        //loop through elements of map
        for (int n in count.keys) {

            //=> each time we explore a branch we start the loop from the begining,
            //so it is essential to check if we still have occurrences left in our element
            if (count[n]! > 0) {
                //add the number to the list
                perm.add(n);
                count[n] = count[n]! - 1; //we have used one occurrence 

                dfs(); //go down further

                //Backtrack and try another candidate
                count[n] = count[n]! + 1;
                perm.removeLast();
            }
        }
    }

    dfs();
    return res;
  }
}

/*
# For python visualizer 


from typing import List

def permuteUnique(nums: List[int]) -> List[List[int]]:
    res = []
    perm =[]
    count = { n:0 for n in nums}

    for n in nums:
        count[n] += 1

    def dfs():
        if len(perm) == len(nums):
            res.append(perm.copy())
            return 

        for n in count:
            if count[n] > 0:
                perm.append(n)
                count[n] -= 1

                dfs()

                count[n] += 1
                perm.pop()
    
    dfs()
    return res
    
print(permuteUnique([1, 1, 2]))
*/