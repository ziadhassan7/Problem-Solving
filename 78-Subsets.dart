class Solution {
  List<List<int>> subsets(List<int> nums) {
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
      subset.removeLast();
      dfs(i + 1);
    }

    dfs(0);
    return res;
  }
}

