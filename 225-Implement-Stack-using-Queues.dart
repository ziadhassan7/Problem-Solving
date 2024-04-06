class Queue <T> {
    List queue = [];

    //add (normally add an element)
    enqueue(T value) => queue.add(value);

    //remove (remove the oldest -at 0-), in a stack (we remove at the top -last-)
    T dequeue() => queue.removeAt(0);

    //in a stack (getLast)
    T peek() => queue.first;

    bool get isEmpty => queue.isEmpty; //return -1

    int get length => queue.length;

    //we should throw Exception('Queue is empty'); in each function if the queue is empty
}

//1 queue solution

class MyStack {

    late Queue<int> queue;

    MyStack() {
        queue = Queue<int>();
    }
    
    void push(int x) {
        //here we rotate the queue
        //add normally, then append on top (what we remove the the bottom -at 0-)

        queue.enqueue(x);
        //add what we remove
        for(int i=0; i<queue.length-1; i++){
            queue.enqueue(queue.dequeue());
        }
    }
    
    int pop() {
        return queue.dequeue();
    }
    
    int top() {
        return queue.peek();
    }
    
    bool empty() {
        return queue.isEmpty;
    }
}

/*
//2 Queue approach

class MyStack {
    late Queue<int> queue1;
    late Queue<int> queue2;

    MyStack() {
        queue1 = Queue<int>();
        queue2 = Queue<int>();
    }
    
    void push(int x) {
        // If queue1 is empty, directly enqueue to queue1
        if (queue1.isEmpty) {
            queue1.enqueue(x);

        } else {
            // Otherwise, move all elements from queue1 to queue2
            while (!queue1.isEmpty) {
                queue2.enqueue(queue1.dequeue());
            }

            // Then enqueue the new element to queue1
            queue1.enqueue(x);

            // Finally, move all elements back from queue2 to queue1
            while (!queue2.isEmpty) {
                queue1.enqueue(queue2.dequeue());
            }
        }
    }
    
    int pop() {
        return queue1.dequeue();
    }
    
    int top() {
        return queue1.peek();
    }
    
    bool empty() {
        return queue1.isEmpty;
    }
}
*/