public class NoOfContactsOnAccount implements database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Name, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<Account> scope){
        for(Account a : scope){
            a.Number_Of_Contacts__c = a.Contacts.size();
        }
        update scope;
    }

    public void finish(Database.BatchableContext BC){
        system.debug('Accounts Updated!!');
    }
}