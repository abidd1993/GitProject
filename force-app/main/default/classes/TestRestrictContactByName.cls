@isTest
public class TestRestrictContactByName {
    @isTest static void Test_insertupdateContact(){
        Contact con = new Contact();
        con.LastName = 'INVALIDNAME';
        
        Test.startTest();
        Database.SaveResult result = Database.insert(con, false);
        Test.stopTest();
        
        System.Assert(!result.isSuccess());
        System.Assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
        
    }

}