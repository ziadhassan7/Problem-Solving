//The nodes are reversed, same as how we do sum in maths

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    
    ListNode dummy = ListNode();
    ListNode curr = dummy;

    int carry = 0;

    while(l1 != null || l2 != null || carry != 0){
        //get the values of both
        int val1 = l1?.val ?? 0;
        int val2 = l2?.val ?? 0;

        //sum the two nodes + if we have a carry from the previous operation
        var sum = val1 + val2 + carry;
        carry = sum ~/ 10; // (~/10) 15=> 1 / 20=> 2

        //assign the current sum //(%10) 15=> 5 / 20=> 0
        curr.next = ListNode(sum % 10);

        //now move
        curr = curr.next!;
        l1 = l1?.next;
        l2 = l2?.next;
    }
    //The last condition in the while loop (carry != 0)
    //because we can finish both lists, but still have a carry at the end
    
    return dummy.next;
  }
}