class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    
    List<List<int>> res = [];
    
    void dfs(int i, List<int> comp, int total){
        // Base Case: Found!!
        if (total == target){
            res.add(List.from(comp));
            return;
        }
        //Exit this branch: Not Good!
        if(i >= candidates.length || total > target) return;

        //Decision to add
        comp.add(candidates[i]);
        dfs(i, comp, total + candidates[i]);

        //Decision NOT to add
        comp.removeLast();
        dfs(i+1, comp, total);
    }

    dfs(0, [], 0);
    return res;
  }
}