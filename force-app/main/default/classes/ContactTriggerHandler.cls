public class ContactTriggerHandler {

    public static Boolean flag = true;

    public void PrimaryContactTrigger(List<Contact> conList, Map<Id,Contact> oldConMap)
    {
        Set<Id> contactIds = new Set<Id>();
        Set<Id> accIds = new Set<Id>();
        Set<Id> accIdToUpdatePrimCon = new Set<Id>();
        Map<Id, String> conName = new Map<Id, String>();
        List<Account> AccountsToUpdate = new List<Account>();

        for(Contact con : conList)
        {
            if(con.Primary_Contact__c == true && con.Primary_Contact__c != oldConMap.get(con.Id).Primary_Contact__c)
            {
                contactIds.add(con.Id);
                accIdToUpdatePrimCon.add(con.AccountId);
                conName.put(con.Id, con.FirstName + ' ' + con.LastName);

                AccountsToUpdate.add(new Account(Id=con.AccountId, Primary_Contact_Name__c = conName.get(con.id)));
            }

            accIds.add(con.AccountId);
        }

        system.debug(accIdToUpdatePrimCon);
        system.debug(conName);

        List<Contact> conToBeFalsed = [SELECT Id, AccountId FROM Contact WHERE AccountId IN : accIds AND Id NOT IN : contactIds];
        List<Contact> conToUpdate = new List<Contact>();

        for(Contact c : conToBeFalsed)
        {
            c.Primary_Contact__c = false;
            conToUpdate.add(c);
        }
                
        flag = false;

        update conToUpdate;

        if(!AccountsToUpdate.isEmpty())
        {
            update AccountsToUpdate;
        }
    }

    public void PrimaryContactTriggerInsert(List<Contact> conList)
    {
        Set<Id> contactIds = new Set<Id>();
        Set<Id> accIds = new Set<Id>();
        Set<Id> accIdToUpdatePrimCon = new Set<Id>();
        Map<Id, String> conName = new Map<Id, String>();
        List<Account> AccountsToUpdate = new List<Account>();

        for(Contact con : conList)
        {
            if(con.Primary_Contact__c == true)
            {
                contactIds.add(con.Id);
                accIdToUpdatePrimCon.add(con.AccountId);
                conName.put(con.Id, con.FirstName + ' ' + con.LastName);

                AccountsToUpdate.add(new Account(Id=con.AccountId, Primary_Contact_Name__c = conName.get(con.id)));
            }

            accIds.add(con.AccountId);
        }

        system.debug(accIdToUpdatePrimCon);
        system.debug(conName);

        List<Contact> conToBeFalsed = [SELECT Id, AccountId FROM Contact WHERE AccountId IN : accIds AND Id NOT IN : contactIds];
        List<Contact> conToUpdate = new List<Contact>();

        for(Contact c : conToBeFalsed)
        {
            c.Primary_Contact__c = false;
            conToUpdate.add(c);
        }
                
        flag = false;

        update conToUpdate;

        if(!AccountsToUpdate.isEmpty())
        {
            update AccountsToUpdate;
        }
    }

    public void PrimaryContactTriggerDelete(List<Contact> oldConList)
    {
        System.debug('Fired!');
        Set<Id> accList = new Set<Id>();
        List<Account> accToUpdate = new List<Account>();

        for(Contact con : oldConList)
        {
            if(con.Primary_Contact__c == true)
            {
                accList.add(con.AccountId);
            }
        }

        for(Account acc : [SELECT Id, Primary_Contact_Name__c FROM Account WHERE Id IN : accList])
        {
            acc.Primary_Contact_Name__c = 'No Primary Contact Selected!!';
            accToUpdate.add(acc);
        }

        update accToUpdate;
    }
}