public class AssignmentDay20 {
    
    public Map<Merchandise__c, List<Line_Item__c>> merchandiseMapMethod()
    {
        Map<Merchandise__c, List<Line_Item__c>> newMap = new Map<Merchandise__c, List<Line_Item__c>>();
        
        for(Merchandise__c mer : [SELECT Id, Name, (SELECT Id, Name, Quantity__c, Invoice__c FROM Merchandise__r) FROM Merchandise__c])
        {
            newMap.put(mer, mer.Merchandise__r);
        }
        
        return newMap;
    }
    
    public void updateInvoiceStatus(){
        List<Invoice__c> invList = new List<Invoice__c>();
        for(Invoice__c inv : [SELECT Id, Status__c, (SELECT Id FROM Invoice__r WHERE Line_Item_Total__c > 100) FROM Invoice__c])
        {
            inv.Status__c = 'Closed';
            invList.add(inv);
        }
        system.debug(invList);
        update invList;
        
    }
    
    
    
    public void updateLineItemPrices()
    {
        
        List<Line_Item__c> lineItemToUpdate = new List<Line_Item__c>();
        
        for(Merchandise__c mer : [SELECT Id, Price__c, (SELECT Id, Unit_Price__c FROM Merchandise__r) FROM Merchandise__c])
        {
            for(Line_Item__c lineItemList : mer.Merchandise__r)
            {
                lineItemList.Unit_Price__c = (mer.Price__c)/(mer.Merchandise__r.size());
                lineItemToUpdate.add(lineItemList);
            }
           
        }
       System.debug(lineItemToUpdate);
       update lineItemToUpdate; 
    }
    
    
    public void updateOrderCompleteOnInvoice(){
        
        List<Line_Item__c> listOfLineItems = [SELECT Id, Merchandise__r.Order_Complete__c, Invoice__r.Id 
                                              FROM Line_Item__c 
                                              WHERE Merchandise__r.Order_Complete__c = true];
        List<Id> listOfIds = new List<Id>();
        
        for(Line_Item__c L : listOfLineItems)
        {
            listOfIds.add(L.Invoice__r.Id);
        }
        System.debug(listOfIds);
        
        List<Invoice__c> invList = [SELECT Id, Order_Complete__c FROM Invoice__c WHERE Id IN : listOfIds];
        system.debug(invList);
        
            
        for(Invoice__c i : invList)
        {
            i.Order_Complete__c = true;
        }
        System.debug(invList);
        update invList;
    }
    
    public void updateCountOfLineItems(){
        List<Merchandise__c> merchList = [SELECT Id, Name, NoOfLineItems__c, (SELECT Id FROM Merchandise__r) 
                                          FROM Merchandise__c];
        
        List<Merchandise__c> listToUpdate = new List<Merchandise__c>();
        
        for(Merchandise__c merch : merchList)
        {
            merch.NoOfLineItems__c = merch.Merchandise__r.size();
            listToUpdate.add(merch);
        }
        
        update listToUpdate;
        
        
    }

}