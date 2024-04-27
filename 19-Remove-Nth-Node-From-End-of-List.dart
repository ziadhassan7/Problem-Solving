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
    ListNode? fast = dummy;
    ListNode? slow = dummy;

    //Edge case: (only one element)
    if(head?.next == null) return null;

    //give fast a head start
    for(int i=1; i<=n; i++){
        fast = fast?.next;
    }

    //now move a step of each
    while(fast?.next != null){
        fast = fast?.next;
        slow = slow?.next;
    }
    //slow is left behind the element that we want to remove


    slow?.next = slow?.next?.next; //we skipped the element that we do not want

    return dummy.next;
  }
}