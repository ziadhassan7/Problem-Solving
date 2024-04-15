class Solution {
  List<String> generateParenthesis(int n) {
    //Only add open ( , if open < n
    //Only add a closing ) , if closed < n
    //Valid if open = closed = n , we reached the end condition

    List stack = [];
    List<String> res = [];

    void backtrack(int openN, int closedN) {
        if (openN == n && closedN == n) { //we have reached a valid compination
            res.add(stack.join()); // join our current compination
            return;
        }

        //we can add an opened
        if (openN < n) {
            stack.add('(');
            backtrack(openN + 1, closedN);
            stack.removeLast();
        }

        //we can add a closed
        if (closedN < openN) {
            stack.add(')');
            backtrack(openN, closedN + 1);
            stack.removeLast();
        }
    }

    backtrack(0, 0); //start recursion with initial values
    return res;
  }
}

