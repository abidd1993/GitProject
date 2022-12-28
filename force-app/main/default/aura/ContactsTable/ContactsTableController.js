({
    doInit : function(component, event, helper) {
        helper.getContacts(component,event);
    },

    handleRowAction : function (component, event, helper) {
        // console.log("new name");
        // var row = event.getSource().get("v.");
        // console.log("row");
        var row = event.getParam('row');
        // alert(row);
        alert("Contact Id: " + row.Id);
    }
})