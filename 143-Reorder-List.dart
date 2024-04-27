/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  void reorderList(ListNode? head) {
    //Get to the middle
    ListNode? slow = head;
    ListNode? fast = head;

    while(fast?.next != null){
        slow = slow?.next;
        fast = fast?.next?.next;
    }
    //now slow is on the middle (last element of the first list)

    //Save a reference to the second list, and break the reference between both (to prevent cycling)
    ListNode? second = slow?.next; //now move to the second list (after the middle)
    slow?.next = null; //break the connection between the first list, and the second list (this is why we saved a ref ↑ to the second list)
    
    //Reverse the second list
    ListNode? prev = null;
    while(second != null){
        ListNode? tempNxt = second.next;

        second.next = prev;

        prev = second;
        second = tempNxt;
    }


    //Two Pointers to add nodes 
    //Keep a temp variable because we are manipulating in the list itself. (refs will change on the run)
    ListNode? first = head;
    second = prev;
    while(second != null){
        //temp
        ListNode? tmp1 = first?.next;
        ListNode? tmp2 = second.next;

        //put elements in correct positions
        first?.next = second;
        second.next = tmp1;

        //move
        first = tmp1;
        second = tmp2;
    }
  }
}