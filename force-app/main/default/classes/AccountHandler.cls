public class AccountHandler {
    public static Account insertNewAccount(String AccountName){
        try {
            Account acc = new Account(Name = AccountName);
            insert acc;
            return acc;
        } catch (DmlException e ) {
            System.debug('A DML Exception has occured: '+ e.getMessage());
            return null;
        }
    }
}