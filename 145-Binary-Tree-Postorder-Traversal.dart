/*
// Recursive Solution
class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    List<int> res = [];

    void inorder(TreeNode? root){
        if (root == null) return;

        inorder(root.left); //visit left (recursively)
        inorder(root.right); //visit right (recursively)
        res.add(root.val); //process root
    }

    inorder(root);
    return res;
  }
}
*/


// Iterative Solution
class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    List<int> res = [];
    final stack = [root];
    final visit = [false];

    while (stack.isNotEmpty) {
        var cur = stack.removeLast();
        final isVisited = visit.removeLast();

        if(cur != null){
            //It is visited before => add it
            if(isVisited){
                res.add(cur.val);

            //if not => continue filling the stack
            } else {
                //we fill the stack in reverse order (unlike the recusrive calls) - because then we would read the elements from the last one added
                stack.add(cur); visit.add(true);

                stack.add(cur.right); visit.add(false);

                stack.add(cur.left); visit.add(false);
            }
        }
    }

    return res;
  }
}