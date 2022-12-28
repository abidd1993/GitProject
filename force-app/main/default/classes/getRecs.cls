public with sharing class getRecs{
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRecsMethod() {
        return [SELECT Id, Name, Account.Name, AccountId FROM Contact];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getCons(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, Phone, Email FROM Contact WHERE Name LIKE :key AND Email != null LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccs(){
        return [SELECT Id, Name, Phone, Type, Industry, BillingStreet, BillingCity, BillingState, BillingCountry, AnnualRevenue 
                FROM Account];
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpps(String searchKey)
    {
        Decimal key = Decimal.valueOf(searchKey);
        return [SELECT Id, Name, Account.Name, AccountId, StageName, Amount, CloseDate 
                FROM Opportunity
                WHERE Amount =: key];
    }
}