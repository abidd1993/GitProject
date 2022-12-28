({
    Add : function(component, event, helper) {
        var a = component.get("v.numberOne");
        var b = component.get("v.numberTwo");
        var Total = parseInt(a) + parseInt(b);

        component.set("v.Total",Total);
    
    },

    Sub : function(component, event, helper){
        var a = component.get("v.numberOne");
        var b = component.get("v.numberTwo");
        var Total = a - b;

        component.set("v.Total",Total);
        
    },

    Mul : function(component, event, helper){
        var a = component.get("v.numberOne");
        var b = component.get("v.numberTwo");
        var Total = a * b;

        component.set("v.Total",Total);
        
    },

    Div : function(component, event, helper){
        var a = component.get("v.numberOne");
        var b = component.get("v.numberTwo");
        
        if(b==0){
            helper.divError();
        } else {
            var Total = a / b;
        }
        

        component.set("v.Total",Total);
        
    },

    Clear : function(component, event, helper){
        component.set("v.numberOne","");
        component.set("v.numberTwo","");
        component.set("v.Total","");
        component.set("v.isAdd",false);
        component.set("v.isSub",false);
        component.set("v.isMul",false);
        component.set("v.isDiv",false);
    }
    
})