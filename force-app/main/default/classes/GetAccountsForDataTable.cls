public with sharing class GetAccountsForDataTable {
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accList = [SELECT Id, Name, Phone, AnnualRevenue, Website, Type, Rating FROM Account ORDER BY CreatedDate LIMIT 10];
        return accList;
    }
}