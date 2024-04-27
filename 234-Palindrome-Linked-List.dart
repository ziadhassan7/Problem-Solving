/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */

//Fast/Slow Pointers
class Solution {
  bool isPalindrome(ListNode? head) {
    ListNode? fast= head;
    ListNode? slow= head;
    
    //Fast/Slow Pointers (when fast is in the end, slow will be in the middle)
    while(fast?.next != null){
        fast = fast?.next?.next;
        slow = slow?.next;
    }

    //Reverse list starting from slow (the middle)
    ListNode? prev=null;
    while(slow != null){
        ListNode? tempNxt = slow.next;

        slow.next = prev;

        prev= slow;
        slow= tempNxt;
    }

    //Check Palindrome (Two Pointers)
    ListNode? left = head;
    ListNode? right = prev; //last head of the reversed portion

    while(right != null){ //it will stop when it reaches null (remember prev was initialized with null, so back to it)
        //check both left and right
        //and move forward (from each direction)
        if(left?.val != right.val){
            return false;
        }
        left= left?.next;
        right= right.next;
    }

    return true;
  }
}

/*
// Using Array and Two Pointers
// T: O(n^2)

class Solution {
  bool isPalindrome(ListNode? head) {
    
    //Save LinkedList in an array
    List array = [];
    while(head != null){
        array.add(head.val);
        head = head.next;
    }

    //use two pointers approach
    int l=0;
    int r=array.length-1;
    while(l<=r){
        if(array[l] != array[r]) return false;
        l++;
        r--;
    }

    return true;
  }
}
*/