/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val; //data (of type int)
 *   ListNode? next; //ref (refering to another node object)

 *   ListNode([this.val = 0, this.next]); //optional positional as it could be null
 * }
 */


//----------Using Recursion

//Code 1
class Solution {
  ListNode? reverseList(ListNode? head, [ListNode? prevNode]) {    
    // Head is null so prev is the last node with a value
    // Return the last node you have which is the prev node (new head of the reversed list)
    if (head == null) return prevNode; 

    // Reverse this node
    var next = head.next;
    head.next = prevNode;

    // Reverse the next node
    return reverseList(next, head); 
  }
}


/*
//Code 2
class Solution {
  ListNode? reverseList(ListNode? head) {
    return reverse(head, null);
  }

  ListNode? reverse(ListNode? head, ListNode? reversed) {
    // Head is null so prev is the last node with a value
    // Return last node we have, which is the reversed prev node (new head)
    if (head == null) return reversed;
    
    // Reverse this node
    reversed = ListNode(head.val, reversed); //now save currentHead refering to the prev (reversed)
    // Reverse the next node
    return reverse(head?.next, reversed); //nextNode, ref to the current reversed node
  }
}
*/

/*
//----------Using Loop
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
*/