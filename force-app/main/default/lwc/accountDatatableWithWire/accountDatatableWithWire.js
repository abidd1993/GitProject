import { LightningElement, track, api , wire } from 'lwc';
import getAccs from '@salesforce/apex/getRecs.getAccs';

export default class AccountDatatableWithWire extends LightningElement {
    @track accData = [];

    columns = [
        { label: 'Name', fieldName: 'Name', type: 'text' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Type', fieldName: 'Type', type: 'text' },
        { label: 'Industry', fieldName: 'Industry', type: 'text' },
        { label: 'BillingStreet', fieldName: 'BillingStreet', type: 'text' },
        { label: 'BillingCity', fieldName: 'BillingCity', type: 'text' },
        { label: 'BillingState', fieldName: 'BillingState', type: 'text' },
        { label: 'BillingPostalCode', fieldName: 'BillingPostalCode', type: 'text' },
        { label: 'BillingCountry', fieldName: 'BillingCountry', type: 'text' },
        { label: 'AnnualRevenue', fieldName: 'AnnualRevenue', type: 'currency' }
    ];

    @wire(getAccs) accounts({error, data}) {
        if (data) {
            this.accData = data;
        }
    }  
}