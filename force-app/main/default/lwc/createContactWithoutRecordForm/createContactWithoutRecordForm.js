import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
// import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
// import { ACCOUNT_ID } from '@salesforce/schema/Contact.AccountId';
import contactGenMethod from '@salesforce/apex/CreateContactLwc.contactGenMethod';

export default class CreateContactWithoutRecordForm extends LightningElement {
    
    @api recordId;
    @api objectApiName;

    fN;
    lN;
    pN;
    eM;
    doB;

    handleCreate(event) {
        this.template.querySelectorAll('lightning-input').forEach(element => {
            switch (element.name){
                case 'firstName':
                    this.fN = element.value;
                    break;
                case 'lastName':
                    this.lN = element.value;
                    break;
                case 'phone':
                    this.pN = element.value;
                    break;
                case 'email':
                    this.eM = element.value;
                    break;
                case 'birthdate':
                    this.doB = element.value;
                    break;
            }
        });

        contactGenMethod({firstName: this.fN, lastName: this.lN, email: this.eM, phone:this.pN, DOB: this.doB, accId: this.recordId})
        .then(result => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Contact has been created for this Account',
                    variant: 'success'
                }),
            );
        }).catch(error => {
            console.log('error: ' + JSON.stringify(error));
        });

        this.template.querySelectorAll('lightning-input').forEach(element => {
        element.value = '';
        });
    }

    handleReset(event) {
        this.template.querySelectorAll('lightning-input').forEach(element => {
        element.value = '';
        });
    }
}