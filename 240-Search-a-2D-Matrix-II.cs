public class Solution {
    public bool SearchMatrix(int[][] matrix, int target) {      
        int rows = matrix.Length;
        int columns = matrix[0].Length;

        int r = rows-1; //last row
        int c = 0; //first column
        while(r >= 0 && c < columns){
            if(target == matrix[r][c]){
                return true;

            } else if (target < matrix[r][c]){
                r--; 

            } else {
                c++; 
            }
            
        }
        
        return false;
    }
}