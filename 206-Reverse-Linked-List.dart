/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val; //data (of type int)
 *   ListNode? next; //ref (refering to another node object)

 *   ListNode([this.val = 0, this.next]); //optional positional as it could be null
 * }
 */
class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? prev = null;
    ListNode? curr = head;

    //loop untill there is no longer a next element
    while(curr != null){
        ListNode? nxt = curr.next; //temp for next

        curr.next = prev;

        prev = curr;
        curr = nxt;
    }

     return prev;
  }
}