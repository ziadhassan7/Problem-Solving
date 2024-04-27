/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public int val;
 *     public ListNode next;
 *     public ListNode(int val=0, ListNode next=null) {
 *         this.val = val;
 *         this.next = next;
 *     }
 * }
 */


//Fast/Slow Pointers
public class Solution {
    public bool IsPalindrome(ListNode head) {
        ListNode fast = head;
        ListNode slow = head;

        //Fast/Slow Pointers (when fast is in the end, slow will be in the middle)
        //loop till there is no next element (but first check if 'first' exists [null safe])
        while(fast != null && fast.next != null){
            fast= fast.next.next;
            slow= slow.next;
        }
        //Now slow is in the middle


        //Reverse the other half of the list (from slow pointer)
        ListNode prev = null;
        while(slow != null){
            ListNode tempNxt = slow.next;

            slow.next = prev;

            prev= slow;
            slow= tempNxt; 
        }


        //Check Palindrome (Two Pointers)
        ListNode left = head;
        ListNode right = prev; //head of the reversed portion

        while(right != null){//remember prev was initialized with null, so loop till we back to it)
            //check both left and right
            //and move forward (from each direction)
            if(left.val != right.val) return false;

            left= left.next;
            right= right.next;
        }

        return true;
    }
}



/*
// Using Array and Two Pointers
// (Extra memory for the Array)

public class Solution {
    public bool IsPalindrome(ListNode head) {
        //Save LinkedList in an array
        List<int> list = new List<int>();
        while (head != null){
            list.Add(head.val);
            head = head.next; 
        }

        //Use two pointers approach
        int l=0;
        int r=list.Count-1;
        while(l<=r){
            if(list[l] != list[r]) return false;
            l++;
            r--;
        }

        return true;
    }
}
*/