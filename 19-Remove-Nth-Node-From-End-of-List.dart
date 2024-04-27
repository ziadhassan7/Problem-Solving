/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    ListNode? dummy = ListNode(0, head);
    ListNode? left = dummy;
    ListNode? right = dummy;

    //Edge case: (only one element)
    if(head?.next == null) return null;

    //give right a head start
    for(int i=1; i<=n; i++){
        right = right?.next;
    }

    //now move a step of each
    while(right?.next != null){
        right = right?.next;
        left = left?.next;
    }
    //slow is left behind the element that we want to remove


    left?.next = left?.next?.next; //we skipped the element that we do not want

    return dummy.next;
  }
}