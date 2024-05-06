class Solution {
  List<List<int>> permute(List<int> nums) {
    List<List<int>> res = [];

    void backtrack(int i) {
      if (i >= nums.length) {
        res.add(List.from(nums));
        return;
      }

      for (int j = i; j < nums.length; j++) {
        swap(nums, i, j); //swap
        backtrack(i + 1);
        swap(nums, i, j); //swap back
      }
    }

    backtrack(0);
    return res;
  }

  void swap(List<int> list, int i, int j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}


/*
//Neetcode Solution

class Solution {
  List<List<int>> permute(List<int> nums) {
    List<List<int>> res = [];

    // base case
    if (nums.length == 1) {
      return [List.from(nums)];
    }

    for (int i = 0; i < nums.length; i++) {
      int n = nums.removeAt(0);
      List<List<int>> perms = permute(nums);

      for (List<int> perm in perms) {
        perm.add(n);
      }
      res.addAll(perms);
      nums.add(n);
    }

    return res;
  }
}
*/