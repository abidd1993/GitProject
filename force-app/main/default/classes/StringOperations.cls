public class StringOperations {
    
    public boolean userInput(String str1){
        if (str1 == ''){
            return null;
        } else if (str1.contains('Test')){
            return TRUE;
        } else if (str1 == 'Salesforce'){
            return TRUE;
        } else return FALSE;
    }
}