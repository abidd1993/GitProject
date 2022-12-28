public with sharing class orderController {
    
    @AuraEnabled
    public static List<Order__c> getOrders(Id recordId) {
        return [SELECT Id, Restaurant__c, Customer__c, Dishes__c, Food_Rating__c, Delivery_Partner_Rating__c, Status__c 
                FROM Order__c 
                WHERE Id =:recordId];
    }
}