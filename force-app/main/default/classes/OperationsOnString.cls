public class OperationsOnString {
    
    public String convertToUpperCase(String str){
        String newString = str.toUpperCase();
        return newString;
    }
    
    public void containsValue(String str){
        
        if (str.contains('value')){
            system.debug('Invalid String');
        } else {
            system.debug('Good String');
        }
    }
    
    public void concat(String str){
        system.debug(str+' Works for Absyz');
    }

}