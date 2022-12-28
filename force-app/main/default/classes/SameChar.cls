public class SameChar {
    
    public void commonChar(String str, String str2){
        
        List<Integer> newList = new List<Integer>();
        
        for(Integer i=0 ; i < str.length() ; i++) {
            
            for(Integer j=0; j < str2.length() ; j++){
                
                if(str.charAt(i) == str2.charAt(j)){
                    
                    newList.add(str.charAt(i));
                }
            }
        }
        system.debug(newList.size());
    }

}