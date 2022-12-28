public class Pattern {
    public void squarePattern(Integer n){
        
        for(Integer i = 1; i <= n ; i++){
            String s = ' ';
            for(Integer j = 1; j <= n ; j++){
                if(i==1 || i==n || j==1 || j==n){
                    s = s + '# ';
                }
                else {
                    s = s+' _ ';
                }
            }
            system.debug(s);
        }
        
    }

}