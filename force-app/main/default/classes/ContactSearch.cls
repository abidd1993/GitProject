public class ContactSearch {
    public static List<Contact> searchForContacts (String lastName, String postalCode){
        List<Contact> Contacts = [SELECT Id, Name FROM Contact WHERE LastName =:lastName and MailingPostalCode =:postalCode];
        return Contacts;
    }

}