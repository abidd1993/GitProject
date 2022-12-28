public class RemoveAbsyz {
    public void remAbs(){
        List<Account> accToUpdate = new List<Account>();
        
        for(Account acc : [SELECT Id, Name FROM Account])
        {
            //acc.Name = acc.Name.removeStart('ABSYZ');
            //acc.Name = acc.Name.removeEnd('Absyz');
            accToUpdate.add(acc);
        }
        update accToUpdate;
    }
}