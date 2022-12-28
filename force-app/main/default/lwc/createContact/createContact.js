import { api, LightningElement } from 'lwc';

export default class CreateContact extends LightningElement {
    @api recordId;

    handleSubmit(event) {
        console.log('inside event');
        event.preventDefault();       // stop the form from submitting
        console.log('event.detail.fields: ' + JSON.stringify(event.detail.fields));
        console.log('recordId: ' + this.recordId);
        // set custom validation for phone field
        var phoneField = this.template.querySelector('.Phone');
        console.log('phoneField: ' + JSON.parse(JSON.stringify(phoneField)));
        console.log('phoneField: ' + phoneField.value);
        console.log('length: ' + phoneField.value.length);
        if (phoneField.value.length < 10) {
            console.log('phoneField: ' + phoneField.value.length);
            setCustomValidity('Phone number is required');
            reportValidity();
        }
    }

    // handleClick() {
    //     console.log('recordId: ' + this.recordId);
    //     // set custom validation for phone field
    //     var phoneField = this.template.querySelector('.Phone');
    //     console.log('phoneField: ' + JSON.parse(JSON.stringify(phoneField)));
    //     console.log('phoneField: ' + phoneField.value);
    //     console.log('length: ' + phoneField.value.length);
    //     if (phoneField.value.length < 10) {
    //         console.log('phoneField: ' + phoneField.value.length);
    //         setCustomValidity('Phone number is required');
    //         reportValidity();
    //     }
        
        // if(phoneField.length < 10) {
        //     alert('Phone number must be 10 digits');
        //     this.template.querySelector('.phone').setCustomValidity('Phone number is invalid');
        // }
    // }
}