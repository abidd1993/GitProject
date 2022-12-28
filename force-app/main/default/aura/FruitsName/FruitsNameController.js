({
    sendMessage : function(component, event, helper) {
        var appEvent = $A.get("e.c:ApplicationEvent");

        appEvent.setParams({
            "message" : "Application Event Fired"
        });

        appEvent.fire();
    }
})