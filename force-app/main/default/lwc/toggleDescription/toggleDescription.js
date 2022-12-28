import { LightningElement, track, wire, api } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import DESC_FIELD from '@salesforce/schema/Participant__c.Description__c';

export default class ToggleDescription extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: [DESC_FIELD] })
    record;

    @track
    showDescription = false;
    buttonLabel = 'Show Description';
    // description = 'This is a description';

    get descriptionField() {
        return getFieldValue(this.record.data, DESC_FIELD);
    }

    toggleDetails(){
        this.showDescription = !this.showDescription;
        this.buttonLabel = this.showDescription ? 'Hide Description' : 'Show Description';
    }
}