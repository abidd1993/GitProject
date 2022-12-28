public with sharing class OrderTriggerHandler {
    public void beforeOrderTrigger(List<Order__c> newOrderList) {

        Set<Id> setOfPrimeCustId = new Set<Id>();
        Set<Id> primeCustOrderIds = new Set<Id>();
        List<Order__c> updatedTotAmt = new List<Order__c>();
        List<String> dishList = new List<String>();
        
        Id normalRecId;
        Id primeRecId;

        
        for(Order__c order : newOrderList){
            // if(order.recordTypeId == '0125h000000yxKoAAI')
            // {
            //     order.Total_Amount__c = order.Total_Amount__c - (order.Total_Amount__c*0.08);
            //     order.Delivery_Charge__c = 0;
            //     system.debug(order.Total_Amount__c);
            // }
            
            // normalRecId = Schema.SObjectType.Order__c.getRecordTypeInfosByName().get('Normal_Member').getRecordTypeId();
            // primeRecId = Schema.SObjectType.Order__c.getRecordTypeInfosByName().get('Prime_Member').getRecordTypeId();

            if(order.recordTypeId == '0125h000000yxKeAAI'){
                if(order.Distance__c < 10){
                    order.Delivery_Charge__c = 80;
                } 
                else if(order.Distance__c > 10 && order.Distance__c < 15){
                    order.Delivery_Charge__c =60;
                }
                else if(order.Distance__c > 15 && order.Distance__c < 25){
                    order.Delivery_Charge__c = 40;
                }
            }

            dishList = order.Dishes__c.split(';'); 
            system.debug(dishList);
            
        }

        Decimal dishAmount = 0;
        Time prepTime = Time.newInstance(0, 0, 0, 0);
        Integer timeToPrepare = 0;

        for(Menu__c menu : [SELECT Id, Name, Dishes__c, Price__c, Preparation_Time__c FROM Menu__c WHERE Dishes__c IN :dishList]){
            timeToPrepare = timeToPrepare + Integer.valueOf(menu.Preparation_Time__c);
            prepTime = Time.newInstance(0, timeToPrepare, 0, 0);
            //prepTime = prepTime + timeToPrepare;
            dishAmount = dishAmount + menu.Price__c;
            system.debug('prepTime is : ' + prepTime);
        }

        for(Order__c order : newOrderList){
            if(order.recordTypeId == '0125h000000yxKoAAI')
            {
                order.Total_Amount__c = dishAmount - (dishAmount*0.08);
                order.Delivery_Charge__c = 0;
                system.debug(order.Total_Amount__c);
            } 
            else if(order.recordTypeId == '0125h000000yxKeAAI'){
                order.Total_Amount__c = dishAmount + order.Delivery_Charge__c;
            } 
            
            Integer roundUpValue = Integer.valueOf(order.Round_up_Distance__c);
            Time distTime = Time.newInstance(0, roundUpValue, 0, 0);
            Time TotalTime = Time.newInstance(0, roundUpValue+timeToPrepare, 0, 0);


            Integer orderTimeHours = order.Order_Time__c.hour();
            Integer orderTimeMinutes = order.Order_Time__c.minute();
            Integer totalMins = orderTimeMinutes + TotalTime.minute();

            Time totTimeToPrepare = Time.newInstance(orderTimeHours, totalMins, 0, 0);
            
            System.debug('distTime is '+distTime);
            System.debug('Total Time' + TotalTime);
            System.debug('Time to prep '+ totTimeToPrepare);

            order.EDT__c = totTimeToPrepare;

            // Add minutes to order time
            // Time myTime = Time.newInstance(18, 30, 2, 20);
            // Integer myMinutes = order.Order_Time__c.minute();
            // myMinutes = myMinutes + TotalTime;

            // order.EDT__c = order.Order_Time__c + prepTime + (distTime);
            system.debug('EDT is : ' + order.EDT__c);
            
        }
    }

    public void afterOrderTrigger(List<Order__c> newOrderList) {
        // Set<Id> dpId = new Set<Id>();
        Map<Id, Decimal> dpIdAndAmtMap = new Map<Id, Decimal>();
        Decimal amtToDp = 0;

        Map<Id, Decimal> custIdAmtMap = new Map<Id, Decimal>();
        Decimal amtToCust = 0;

        for(Order__c order : newOrderList){
            amtToDp = 2*order.Total_Amount__c/3;
            system.debug('amtToDp is : ' + amtToDp);

            dpIdAndAmtMap.put(order.Delivery_Partner__c, amtToDp);
            system.debug('Map is : ' + dpIdAndAmtMap);


            amtToCust = order.Total_Amount__c/2;
            custIdAmtMap.put(order.Customer__c, amtToCust);
            
        }

        List<Contact> dpListToUpdate = new List<Contact>();

        for(Contact dp : [SELECT Id, CostEarned__c FROM Contact WHERE Id IN :dpIdAndAmtMap.keySet()]){
            if(dp.CostEarned__c == null){
                dp.CostEarned__c = dpIdAndAmtMap.get(dp.Id);
                dpListToUpdate.add(dp);
            } else {
                dp.CostEarned__c = dp.CostEarned__c + dpIdAndAmtMap.get(dp.Id);
                dpListToUpdate.add(dp);
                system.debug('dpListToUpdate is : ' + dpListToUpdate);
            }
        }
        System.debug('dpListToUpdate outside for Loop is : ' + dpListToUpdate);
        update dpListToUpdate;


        List<Contact> custListToUpdate = new List<Contact>();

        for(Contact cust : [SELECT Id, Earned_Points__c, No_Of_Orders__c, (SELECT Id FROM Orders__r) FROM Contact WHERE Id IN :custIdAmtMap.keySet()]){
            
            cust.No_Of_Orders__c = cust.Orders__r.size();
            Decimal orderAdder = cust.No_Of_Orders__c/2;
            
            if(cust.Earned_Points__c == null){
                cust.Earned_Points__c = custIdAmtMap.get(cust.Id) + orderAdder;
                custListToUpdate.add(cust);
            } else {
                cust.Earned_Points__c = cust.Earned_Points__c + custIdAmtMap.get(cust.Id) + orderAdder;
                custListToUpdate.add(cust);
                system.debug('custListToUpdate is : ' + custListToUpdate);
            }
        }

        update custListToUpdate;



    }
}