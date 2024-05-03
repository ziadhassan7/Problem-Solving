/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public int val;
 *     public ListNode next;
 *     public ListNode(int x) { val = x; }
 * }
 */
public class Solution {
    public void DeleteNode(ListNode node) {
        //it is guaranteed that the given node node is not the last node in the linked list.
        node.val = node.next.val;
        node.next = node.next.next;
    }
}