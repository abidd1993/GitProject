({
    sendMessage : function(component, event, helper) {
        var componentEvent = component.getEvent("myEvent");
        

        componentEvent.setParams({
            "message" : "Component Event Fired"
        });
        componentEvent.fire();

    }
})