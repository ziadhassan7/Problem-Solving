/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */


class Solution {
  ListNode? reverseBetween(ListNode? head, int left, int right) {
    ListNode? dummy = ListNode(0, head);

    ListNode? leftPrev = dummy;
    ListNode? curr = head;

    //1) walk until you reach node at Left
    //  (left-1) because at the end of this operation we will have the next node be our current
    //  leftPrev is gonna be the prev node refereing to the node before left
    for (int i = 1; i < left; i++) {
      curr = curr?.next;
      leftPrev = leftPrev?.next;
    }

    //2) reverse portion from Left to Right
    ListNode? prev = null;
    for(int i=0; i< (right - left+1); i++){
        ListNode? tempNext = curr?.next;

        curr?.next= prev;

        prev = curr; 
        curr = tempNext;
    }

    //3) Update pointers
    //   (leftPrev) is the last node behind left 
    leftPrev?.next?.next = curr; //node at left should referese to (current: after right)
    leftPrev?.next = prev; //node before left should referese to (prev: at right)


    return dummy.next;
  }
}
