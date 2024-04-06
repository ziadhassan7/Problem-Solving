public class Solution {
    public string MergeAlternately(string word1, string word2) 
    {
        StringBuilder text = new();		

        int p = 0, j = 0;

        int maxLengthOfBothWords = GetMaxInt(word1.Length, word2.Length);

        //loop through both words by the length of the tallest word
        for(int i=0; i<maxLengthOfBothWords; i++){
            //be sure your in boundries of word1
            if(p < word1.Length){
                //add character
                text.Append(word1[p]);
                p++;
            }

            //be sure your in boundries of word2
            if(j < word2.Length){
                //add character
                text.Append(word2[j]);
                j++;
            }
        }
        

		//Convert StringBuilder to a String
        return text.ToString();
    }

    int GetMaxInt(int v1, int v2){
        return (v1 > v2)? v1 : v2;
    }

}

/*
//Solution 1

public class Solution {
    public string MergeAlternately(string word1, string word2) 
    {
        StringBuilder text = new StringBuilder();		

        int p = 0, j = 0;

        //loop through both words at the same rate
        //add character from here, and then from there
        //add characters from each word by the same index
        while (p < word1.Length && j < word2.Length){
            text.Append(word1[p]).Append(word2[j]);
            p++;
            j++;
        }

        //now that the last condition is fulfilled,
        //either word1 or word2 still has some characters

        //loop through the remaining of word1, if p is in boundries        
        while(p < word1.Length){
            text.Append(word1[p]);
            p++;
        }

        //loop through the remaining of word1, if j is in boundries 
        while(j < word2.Length){
            text.Append(word2[j]);
            j++;
        }

		//Convert StringBuilder to a String
        return text.ToString();
    }

}
*/