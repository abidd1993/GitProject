({
    divError : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Error!!',
            message: 'Cannot divide by 0!!',
            type: 'error'
        });
        toastEvent.fire();
    }
})