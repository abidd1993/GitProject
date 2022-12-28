public class RockPaperScissors {
    
    public String playGame(String player1, String player2){
        String p1w = 'Player 1 wins';
        String p2w = 'Player 2 wins';
       
        
        if(player1 == player2){
            return 'TIE';
        } 
        else switch on player1{
            
            when 'Rock' {
                if(player2 == 'Paper'){
                    return p2w;
                } else return p1w;
            }
            when 'Paper'{
                if(player2 == 'Scissors'){
                    return p2w;
                } else return p1w;
            }
            when 'Scissors'{
                if(player2 == 'Rock'){
                    return p2w;
                } else return p1w;
            }
        }
        return 'Invalid input';
    }

}