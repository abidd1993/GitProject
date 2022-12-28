public class StringArrayTest {
    public static List<String> generateStringArray (Integer N){
        List<String> testList = new List<String> ();
        for(Integer i=0; i < N; i++){
            testList.add('Test ' + i);
            System.debug(testList[i]);
        }
        return testList;
    }

}