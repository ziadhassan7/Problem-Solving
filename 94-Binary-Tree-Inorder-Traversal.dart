/*
// Recursive Solution
class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    List<int> res = [];

    void inorder(TreeNode? root){
        if (root == null) return;

        inorder(root.left); //visit left (recursively)
        res.add(root.val); //process root
        inorder(root.right); //visit right
    }

    inorder(root);
    return res;
  }
}
*/


// Iterative Solution
class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    List<int> res = [];
    List<TreeNode?> stack = [];
    TreeNode? curNode = root;

    while (curNode != null || stack.isNotEmpty){
        while(curNode != null){
            stack.add(curNode); //add to stack temporarily
            curNode = curNode.left; //go further left
        }
        //now that there are no nodes in the left
        
        curNode = stack.removeLast(); //get the last element and remove it (backtrack)
        res.add(curNode!.val);//process root
        curNode = curNode.right; //go right
    }

    return res;
  }
}
