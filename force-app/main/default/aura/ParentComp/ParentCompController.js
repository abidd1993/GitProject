({
    handleComponentEvent : function(component, event, helper) {
        var message = event.getParam("message");
        component.set("v.messageFromChild", message);
    },

    handleApplicationEvent : function(component, event, helper) {
        var messageNew = event.getParam("message");
        component.set("v.messageFromFruitNames", messageNew);
    }
})