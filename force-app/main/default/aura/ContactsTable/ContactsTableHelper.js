({
    getContacts : function(component, event, helper) {
        component.set("v.columns", [
            {label: 'FirstName', fieldName: 'FirstName', type: 'text'},
            {label: 'LastName', fieldName: 'LastName', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'email'},
            {label: 'Phone', fieldName: 'Phone', type: 'Phone'},
            {type: 'button', typeAttributes: {label: 'Show Details', name: 'idDetail', title: 'Click to View'}}
        ]);

        var action = component.get("c.getContactsMethod");
        action.setParams({});

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.contacts", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }

    
})