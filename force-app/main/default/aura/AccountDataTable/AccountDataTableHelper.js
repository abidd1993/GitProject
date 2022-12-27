({
    getAccounts : function(component, event) {
        component.set("v.columns",[
            {label: "Account Name", fieldName: "linkName", type: "url",
                typeAttributes: {label: { fieldName: "Name" }, target: "_blank"}},

            {label:"Phone", fieldName:"Phone", type:"Phone"},
            {label:"Annual Revenue", fieldName:"AnnualRevenue", type:"Currency"},
            {label:"Website", fieldName:"Website", type:"url"}, 
            {label:"Type", fieldName:"Type", type:"Text"},
            {label:"Rating", fieldName:"Rating", type:"Text"}
        ]);

        var action = component.get("c.getAccounts");
        action.setParams({});

        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var records = response.getReturnValue();

                records.forEach(function(record){
                    record.linkName = 'lightning.force.com/lightning/r/Account/'+record.Id+'/view';
                });

                component.set("v.accList", records);
            }
        });

    $A.enqueueAction(action);
    }
})