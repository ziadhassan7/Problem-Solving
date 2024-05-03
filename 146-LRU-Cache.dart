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
        //remove from the list and delete the LRU from the hashmap
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
        Node prev = right.prev!;
        prev.next = node;
        right.prev = node;
        node.prev = prev;
        node.next = right;
    }
}

