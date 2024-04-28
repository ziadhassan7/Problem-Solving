/*
// Definition for a Node.
public class Node {
    public int val;
    public Node next;
    public Node random;
    
    public Node(int _val) {
        val = _val;
        next = null;
        random = null;
    }
}
*/

public class Solution {
    public Node CopyRandomList(Node head) {

        if(head == null) return null;

        Dictionary<Node, Node> copies = new Dictionary<Node, Node>();

        //First Pass
        //Copy nodes (without any pointers)
        Node cur = head;
        while(cur != null){
            Node copy = new Node(cur.val);
            copies.Add(cur, copy);
            cur = cur.next;
        }


        //Second Pass (assign pointers)
        cur = head;
        while(cur != null){
            Node copy = copies[cur]; //get the copied node

            //Now we need to know what is cur.next $ cur.random pointing to, in our copy node
            //But we have a hashmap with Node opjects as its KEYS
            copy.next = cur.next!=null? copies[cur.next] : null;
            copy.random = cur.random!=null? copies[cur.random] : null;

            cur = cur.next;
        }


        return copies[head]; //holds a ref to the head of the copies, by the key of the original list
    }
}

//In other languages you could have handled the Edge Case of a null pointer
//By making a Key:Value => null:null in the original map