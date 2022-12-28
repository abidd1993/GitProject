({
    updateOrder : function(component, event, helper) {

        var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "type":"success",
                    "title":"Success!",
                    "message":"The record has been updated successfully."
                });
                toastEvent.fire();
        
            var custId  = component.find("custId").get("v.value");
            console.log('custId: ' + custId);

            var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                "recordId": custId,
                "slideDevName": "detail"
            });
            navEvt.fire();


        // // var action = component.get("c.updateOrder");
        // action.setParams({


        //     // "orderId" : component.get("v.recordId"),
        //     // "orderName" : component.get("v.orderName"),
        //     // "orderStatus" : component.get("v.orderStatus"),
        //     // "orderAmount" : component.get("v.orderAmount")
        // });
        // action.setCallback(this, function(response){
        //     var state = response.getState();
        //     if(state === "SUCCESS") {
                
                // var custId = response.getReturnValue();
                

                



                // var customerId = component.get("v.recordId");
                // var cusId = component.find("recordId").get("v.custId");
                // var cid = component.find("custId");
                // console.log(JSON.stringify(customerId));
                // console.log(JSON.stringify(cusId));
                // console.log(JSON.stringify(cid));
                
                

                
                // var navEvt = $A.get("e.force:navigateToSObject");
                //     navEvt.setParams({
                //     "recordId": component.find("v.custId") ,
                //     "slideDevName": "related"
                // });
                // navEvt.fire();
        //     } else {
        //         var toastEvent = $A.get("e.force:showToast");
        //         toastEvent.setParams({
        //             "type":"warning",
        //             "title":"Warning!!",
        //             "message":"Mandatory Fields Missing!!"
        //         });
        //         toastEvent.fire();
        //     }
        // });
        // $A.enqueueAction(action);

        
    },

    // doInit : function(component, event, helper) {
    //     var action = component.get("c.getOrders");
    //     action.setParams({
    //         "Id" : component.get("v.recordId")
    //     });
        
    // }
})