/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    ListNode? dummy = ListNode(); //will refer to the head
    ListNode? tail = dummy; //Will always refer to the last node

    //while both nodes are not null (neither of the lists is finished)
    while ((list1 != null) && (list2 != null)){
        //Input the smaller of two nodes
        if(list1.val < list2.val){
            tail?.next = list1; //add this node
            list1 = list1.next; //move the list you added from
        } else {
            tail?.next = list2; //add this node
            list2 = list2.next; //move the list you added from
        }
        //Move the current tail to the last node (again)
        tail = tail?.next;
    }

    //one list still has some nodes
    if(list1 != null){
        tail?.next = list1;

    } else {
        tail?.next = list2;
    }

    return dummy.next;
  }
}