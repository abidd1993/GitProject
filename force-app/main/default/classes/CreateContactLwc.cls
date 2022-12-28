public with sharing class CreateContactLwc {
    @AuraEnabled(cacheable=false)
    public static void contactGenMethod(String firstName, String lastName, String email, String phone, date DOB, String accId) {
        Contact con = new Contact(FirstName = firstName, LastName = lastName, Email = email, Phone = phone, Birthdate = DOB, AccountId = accId);
        insert con;
    }
}