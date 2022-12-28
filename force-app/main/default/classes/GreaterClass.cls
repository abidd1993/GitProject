public class GreaterClass {
    public List<Integer> greaterThanNeighbour(List<Integer> inputList){
        
        List<Integer> newList = new List<Integer>();
        
        for(Integer i = 1 ; i < inputList.size() -1 ; i++)
        {
            if (inputList[i] > inputList[i-1] && inputList[i] > inputList[i+1]){
                newList.add(inputList[i]);
            }
        }
        return newList;
    }

}