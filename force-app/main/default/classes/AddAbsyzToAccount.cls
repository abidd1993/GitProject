public class AddAbsyzToAccount implements Database.Batchable<sObject> {

    public Database.QueryLocator start (Database.BatchableContext BC) {
        String query = 'SELECT Id, Name FROM Account';
        
        return Database.getQueryLocator(query);

    }

    public void execute(Database.BatchableContext BC, List<Account> scope){
        for(Account a : scope)
        {
            a.Name = 'ABSYZ ' + a.Name; 
        }

        update scope;
    }

    public void finish(Database.BatchableContext BC)
    {
        System.debug('Batch Apex Executed!!');
    }
}