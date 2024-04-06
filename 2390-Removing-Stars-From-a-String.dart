class Solution {

    List<String> stack = [];

    String removeStars(String s) {

        for(int i=0; i<s.length; i++){

            if(s[i] == "*"){
                if(stack.isNotEmpty) stack.removeLast();

            } else {
                stack.add(s[i]);
            }
        }

        return stack.join('');
    }
}