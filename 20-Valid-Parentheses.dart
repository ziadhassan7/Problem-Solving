class Solution {
    bool isValid(String s) {
        final Map<String, String> bracketMap = {
            ')': '(',
            '}': '{',
            ']': '[',
        };
        
        final List<String> stack = [];
        
        //Loop through the characters of the string
        for (var char in s.split('')) {
            //if open parenthese => add to the stack
            if (bracketMap.containsValue(char)) {
                stack.add(char);

            //if closed paresnthese => search in the stack if it has a matching open parenthese
            } else if (bracketMap.containsKey(char)) {
                if (stack.isNotEmpty && stack.last == bracketMap[char]) {
                    stack.removeLast(); //it matches :) pop
                } else {
                    return false; //:(
                }
            }
        }
        
        return stack.isEmpty;
    }
}

/*

a stack has all the opened parenthese that we meet in our string

we compare the closed parenthese with the last opened parethese we added, because the last one, is the closest one ()

*/


/*

// A STACK

//Hint To Use a Stack: 

//The Top => the last element added , because a stack starts from down and builds to the top
//Pop => pop the element at the top => remove the last element
//Push => stack a new element on top => add


//Here we have an example using a custom Stack

class Solution {
  bool isValid(String s) {
      Map<String, String> bracketMap = {')':'(', '}':'{', ']':'['};
    CustomStack<String> stack = CustomStack<String>();
    for(int i = 0; i < s.length; i++){
        if(s[i] == '(' || s[i] == '{' || s[i] == '['){
            stack.push(s[i]);
        } else {
            if(stack.isEmpty) {
                return false;
            } else {
                if(stack.top == bracketMap[s[i]]){
                    stack.pop();
                } else {
                    return false;
                }
            }
        }
    }

    return stack.isEmpty;
  }
}

class CustomStack<T> {
  final _list = <T>[];

  void push(T value) => _list.add(value);

  T pop() => _list.removeLast();

  T get top => _list.last;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}

*/