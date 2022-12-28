public class ReverseCollection {
    
    public List<Integer> reverseNumbers(List<Integer> inputList){
        List<Integer> newList = new List<Integer>();
        for(Integer i = inputList.size() - 1 ; i >= 0 ; i--){
            newList.add(inputList[i]);
        }
        return newList;
    }

}