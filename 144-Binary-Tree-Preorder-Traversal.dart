/*
// Recursive Solution
class Solution {
  List<int> preorderTraversal(TreeNode? root) {
    List<int> res = [];

    void inorder(TreeNode? root){
        if (root == null) return;

        res.add(root.val); //process root
        inorder(root.left); //visit left (recursively)
        inorder(root.right); //visit right (recursively)
    
    }

    inorder(root);
    return res;
  }
}
*/


// Iterative Solution
class Solution {
  List<int> preorderTraversal(TreeNode? root) {
    List<int> res = [];
    List<TreeNode?> stack = [];
    TreeNode? curNode = root;

    while (curNode != null || stack.isNotEmpty){

        if(curNode != null){
            res.add(curNode.val); //process root
            stack.add(curNode.right); //add right
            curNode = curNode.left; //go to left

        } else {
            //we reached a dead end => get the last node from stack
            curNode = stack.removeLast(); 
        }
    }

    return res;
  }
}

/*
// Solution 2
class Solution {
  List<int> preorderTraversal(TreeNode? root) {
    List<int> res = [];
    List<TreeNode?> stack = [];

    if (root != null) {
        stack.add(root);
    }

    while (stack.isNotEmpty) {
        final node = stack.removeLast();
        res.add(node!.val); // process root

        if (node.right != null) {
            stack.add(node.right); // go to right
        }
        if (node.left != null) {
            stack.add(node.left); //go to left
        }

        //this will be repeated till left is null
    }

    return res;
  }
}
*/
