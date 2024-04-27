class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    // handle edge case: lists is empty
    if (lists.isEmpty) return null;

    //Divide and Conquer
    //We will keep cutting the lists in half till there is only one remaining
    while (lists.length > 1) {
        List<ListNode?> mergedLists = [];

        //take first list and second list, and merge them 
        //using two lists at the same time means we should jump by two (to not reuse old lists)
        //So now we have a couple of merged lists, that are half of the original lists
        //we can have an odd number like 3 => 2 , 1 (the second lists here is empty and that's fine)
        for (int i = 0; i < lists.length; i += 2) {
            ListNode? l1 = lists[i];
            ListNode? l2 = (i + 1) < lists.length ? lists[i + 1] : null;
            mergedLists.add(mergeList(l1, l2)); //Conquer (merge two lists)
        }
        //add the new merged lists instead of the original list, then re-iterate again and keep cutting till we reach one list
        lists = mergedLists;
    }

    return lists[0];
  }

  ListNode? mergeList(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode();
    ListNode? tail = dummy;

    while (l1 != null && l2 != null) {
        if (l1.val < l2.val) {
            tail?.next = l1;
            l1 = l1.next;
        } else {
            tail?.next = l2;
            l2 = l2.next;
        }
        tail = tail?.next;
    }

    if (l1 != null) {
        tail?.next = l1;
    }
    if (l2 != null) {
        tail?.next = l2;
    }

    return dummy.next;
  }
}

