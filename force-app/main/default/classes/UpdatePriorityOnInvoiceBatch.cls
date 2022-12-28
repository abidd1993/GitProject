public class UpdatePriorityOnInvoiceBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(database.BatchableContext BC) {
        String query = 'SELECT Id, Name, Invoice_Total__c, Priority__c FROM Invoice__c';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<Invoice__c> scope){

        List<Invoice__c> invListToUpdate = new List<Invoice__c>();

        for(Invoice__c inv : scope)
        {
            if(inv.Invoice_Total__c < 10000)
            {
                inv.Priority__c = 'Low';
            } 

            else if(inv.Invoice_Total__c > 50000)
            {
                inv.Priority__c = 'High';
            } 

            else inv.Priority__c = 'Medium';

            invListToUpdate.add(inv);
             
        }
        update invListToUpdate;
    }

    public void finish(Database.BatchableContext BC){
        System.debug('Invoice Update Batch Executed!!');
    }
}