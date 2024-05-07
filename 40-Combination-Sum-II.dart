class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    //To skip duplicates
    candidates.sort();

    List<List<int>> res = [];
    void backtrack(int start, List<int> comp, int total){
        if(total == target) res.add(List.from(comp));

        if(total > target) return;


        int prev = -1;
        for(int i=start; i<candidates.length; i++){
            //Skip to the nex loop when you find a duplicate (i++)
            if(candidates[i] == prev) continue;

            comp.add(candidates[i]);
            backtrack(i+1, comp, total + candidates[i]);
            comp.removeLast();
            prev = candidates[i];
        }
    }

    backtrack(0, [], 0);
    return res;
  }
}