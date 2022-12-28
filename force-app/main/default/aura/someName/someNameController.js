({
    updateOrder : function(component, event, helper) {
        var action = component.get("c.updateOrder");
        action.setParams({


            // "orderId" : component.get("v.recordId"),
            // "orderName" : component.get("v.orderName"),
            // "orderStatus" : component.get("v.orderStatus"),
            // "orderAmount" : component.get("v.orderAmount")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "type":"success",
                    "title":"Success!",
                    "message":"The record has been updated successfully."
                });
                toastEvent.fire();
            } else {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "type":"warning",
                    "title":"Warning!!",
                    "message":"Mandatory Fields Missing!!"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);

        var navEvt = $A.get("e.force:navigateToSObject");
            navEvt.setParams({
            "recordId": custId,
            "slideDevName": "related"
        });
        navEvt.fire();
    },

    doInit : function(component, event, helper) {
        var action = component.get("c.getOrders");
        action.setParams({
            "Id" : component.get("v.recordId")
        });
        
    }
})