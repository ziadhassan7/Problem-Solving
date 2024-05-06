class Solution {
  List<List<int>> subsetsWithDup(List<int> nums) {
    nums.sort();

    List<List<int>> res = [];

    List<int> subset = [];
    void dfs(int i) {
      if (i >= nums.length) {
        res.add(List.from(subset));
        return;
      }

      // decision to include nums[i]
      subset.add(nums[i]);
      dfs(i + 1);

      // decision NOT to include nums[i]
      while(i+1 < nums.length && nums[i] == nums[i+1]){ //Skip duplicate for this branch
        i+=1;
      }
      subset.removeLast();
      dfs(i + 1);
    }

    dfs(0);
    return res;
  }
}