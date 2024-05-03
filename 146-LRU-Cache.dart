class Node {
    int key;
    int val;
    Node? prev;
    Node? next;

    Node(this.key, this.val) {
        prev = next = null;
    }
}

class LRUCache {
    int capacity;
    late Map<int, Node> cache;
    late Helper helper;

    LRUCache(this.capacity) {
        cache = {}; // map (key to node)
        helper = Helper(); //helper functions
    }



    int get(int key) {
        if (!cache.containsKey(key)) return -1;
        
        helper.makeRecent(cache[key]!);
        return cache[key]!.val;
    }

    void put(int key, int value) {
        if (cache.containsKey(key)) {
            helper.removeNode(cache[key]!);
        }
        
        Node node = Node(key, value);
        cache[key] = node;
        helper.insertNode(node);

        if (cache.length > capacity) {
            Node removed = helper.removeLeastUsed();
            cache.remove(removed.key);
        }
    }
}

class Helper{
    late Node left;
    late Node right;

    Helper(){
        //Left=LRU , right=most recent
        left = Node(0, 0);
        right = Node(0, 0);
        left.next = right;
        right.prev = left;
    }

    void makeRecent(Node node){
        removeNode(node);
        insertNode(node);
    }

    Node removeLeastUsed(){
        //get LRU from the hashmap, and remove it
        Node lru = left.next!;
        removeNode(lru);
        return lru;
    }

    // remove node from List
    void removeNode(Node node) {
        Node prev = node.prev!;
        Node next = node.next!;
        prev.next = next;
        next.prev = prev;
    }

    //insert node at right
    void insertNode(Node node) {

        ///-----Add the new node to the last of the list
        //save the prev of the right (the recent element)
        Node oldMostRecent = right.prev!; 
        //the next of (the most recent) => points to this node (adding it to the linked list in the right)
        oldMostRecent.next = node;


        ///----Make right point to the new recent element (our new node)
        //Now adjust the pointer to the most recent element to this node
        right.prev = node;


        ///----Make new connections to our new node
        //this node .prev => becomes (the prev of the old most recent)
        node.prev = oldMostRecent;
        //this node .next => points to the dummy (right) node with all its connections
        node.next = right;
    }
}

