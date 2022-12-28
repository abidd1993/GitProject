public with sharing class CreateContactFromAura {
    @AuraEnabled
    public static void createCon(String firstName, String lastName, String email, String phone, String accId) {
        Contact con = new Contact();
        con.FirstName = firstName;
        con.LastName = lastName;
        con.Email = email;
        con.Phone = phone;
        con.AccountId = accId;

        insert con;
    }
}