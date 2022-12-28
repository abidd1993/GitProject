public class DeleteLineItemBatchApex implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id FROM Line_Item__c';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<Line_Item__c> scope){
        delete scope; 
    }

    public void finish(Database.BatchableContext BC){
        System.debug('All Line Items Deleted!!');
    }
}