class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {

    int rows = matrix.length; //matrix has 3 arrays meaning 3 rows
    int columns = matrix[0].length; //length of row, is number of columns

    //Binary Search the rows
    int topRow = 0; //first row
    int botRow = rows-1; //last row

    while(topRow <= botRow){
        int midRow = (topRow+botRow) ~/2;
        List row = matrix[midRow];

        //target is bigger than last element in [middle row]
        if(target > row[columns-1]) {
            topRow = midRow+1; //look at bigget rows (from the middle to the bottom)

        //target is smaller than first element in [middle row]
        } else if(target < row[0]) {
            botRow = midRow-1; //look at smaller rows (from the middle to the top)

        //in range
        } else {
            return binarySearchElement(row, target);
        }
    }

    return false;
  }

  //Binary Search elements in Row
  bool binarySearchElement(List row, int target){

    int l=0;
    int r=row.length-1;
    while(l<=r){
        int mid = (l+r) ~/2;

        if(row[mid] == target) return true;
        if(row[mid] > target) r=mid-1;
        if(row[mid] < target) l=mid+1;
    }

    return false;
  }
}