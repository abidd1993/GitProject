public class SumOfVariables {
    
    public void inchesToFeet(Integer var1, Integer var2){
        Integer sum = var1 + var2;
        Integer result = sum/12;
        Integer remainder = Math.Mod(sum, 12);
        system.debug('The sum of given integers in feet is: '+result+' feet and '
                     +remainder+' inches.');
    }
    
    public void metersToKM(Integer var1, Integer var2){
        Integer sum = var1+var2;
        Integer result = sum/1000;
        Integer remainder = Math.Mod(sum, 1000);
        system.debug('The sum of given integers in Kilometers is: '+result+' KM and '
                     +remainder+' meters.');
        
    }

}