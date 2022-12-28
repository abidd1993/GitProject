public with sharing class getRecsHackathon {

    @AuraEnabled(cacheable=true)
    public static List<Menu__c> getRecsHackathonMethod() {
        return [SELECT Id, Restaurant__r.Name, Category__c, Dishes__c, Dish_Rating__c, Price__c 
                FROM Menu__c];
    }
}