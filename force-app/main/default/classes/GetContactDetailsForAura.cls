public with sharing class GetContactDetailsForAura {
    @AuraEnabled
    public static List<Contact> getContactsMethod() {
        List<Contact> conList = [SELECT Id, FirstName, LastName, Email, Phone FROM Contact];
        return conList;
    }
}