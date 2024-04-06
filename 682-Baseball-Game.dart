class Solution {
  int calPoints(List<String> operations) {

    List<int> stack = [];
    int count = 0;
    
    for(int i=0; i<operations.length; i++){
        if(operations[i] == \C\){
            count = count - stack.last;
            stack.removeLast();
        
        } else if(operations[i] == \D\){
            count = count + (stack.last *2);
            stack.add(stack.last*2);

        }  else if(operations[i] == \+\){
            count = count + (stack.last + stack[stack.length-2]);
            stack.add(stack.last + stack[stack.length-2]);

        } else {
            count = count + int.parse(operations[i]);
            stack.add(int.parse(operations[i]));
        }
    }

    return count;

  }
}