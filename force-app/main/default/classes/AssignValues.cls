public class AssignValues {
    Integer val1 = 10;
    Integer val2 = 20;
    Integer val3 = 30;
    
    public void assignNewValues(){
        System.debug('Old Values: '+val1+' '+val2+' '+val3);
        val1 = 100;
        val2 = 200;
        val3 = 300;
        System.debug('New Values: '+val1+' '+val2+' '+val3);
    }

}