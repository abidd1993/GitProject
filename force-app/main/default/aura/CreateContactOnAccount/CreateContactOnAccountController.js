({
    CreateContact : function(component, event, helper) {
        var action = component.get("c.createCon");

        action.setParams({
            "firstName" : component.get("v.FirstName"),
            "lastName" : component.get("v.LastName"),
            "email" : component.get("v.Email"),
            "phone" : component.get("v.Phone"),
            "accId" : component.get("v.recordId")
        });

        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "type":"success",
                    "title":"Success!",
                    "message":"The record has been created successfully."
                });
                toastEvent.fire();

                component.set("v.FirstName","");
                component.set("v.LastName","");
                component.set("v.Phone","");
                component.set("v.Email","");
                
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
    },

    Clear : function(component, event, helper){
        component.set("v.FirstName","");
        component.set("v.LastName","");
        component.set("v.Phone","");
        component.set("v.Email","");
    }
})