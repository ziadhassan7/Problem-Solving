/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = MinStack();
 * obj.push(val);
 * obj.pop();
 * int param3 = obj.top();
 * int param4 = obj.getMin();
 */

//To achieve the most optimal solution, we are gonna use
//another stack for the minimun numbers
class MinStack {
    
    late List<int> stack;
    late List<int> minStack;

    MinStack() {
        stack = [];
        minStack = [];
    }
    
    void push(int val) {
        stack.add(val);

        if(minStack.isEmpty){
            minStack.add(val);

        } else if(val < minStack.last){
            minStack.add(val);
        } else {
            minStack.add(minStack.last);
        }
    }
    
    void pop() {
        stack.removeLast();

        minStack.removeLast();
    }
    
    int top() => stack.last;
    
    int getMin() {

        return minStack.last;
    }
}

/*
//That's not in O(1) beacuse when we use getMin(), we loop through all the elemets!
class MinStack {
    
    List<int> stack = [];

    MinStack() {
        
    }
    
    void push(int val) => stack.add(val);
    
    void pop() => stack.removeLast();
    
    int top() => stack.last;
    
    int getMin() {
        int min = stack[0] ?? 100000;

        for(int n in stack){
            min = n < min ? n : min;
        }

        return min;
    }
}
*/