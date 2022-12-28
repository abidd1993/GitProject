import { api, LightningElement, track, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

import getRecsHackathonMethod from '@salesforce/apex/getRecsHackathon.getRecsHackathonMethod';

export default class RestaurantTable extends NavigationMixin (LightningElement) {
    @track menuData = [];
    @api recordId;
    


    // get columns where fields are Dishes__c, Dish_Rating__c, Price__c 
    columns = [
        { label: 'Restaurant Name', fieldName: 'linkName', type: 'url',
        typeAttributes: {label: { fieldName: 'Restaurant__r.Name' }, target: "_blank"}},
        { label: 'Category', fieldName: 'Category__c', type: 'text' },
        { label: 'Dish Name', fieldName: 'Dishes__c', type: 'text' },
        { label: 'Dish Rating', fieldName: 'Dish_Rating__c', type: 'number', sortable: true },
        { label: 'Price', fieldName: 'Price__c', type: 'currency' }
    ];

    @wire(getRecsHackathonMethod) menu({error, data}) {
        if (data) {
            this.menuData = data;
            console.log('menuData: ', JSON.stringify(this.menuData));
            this.menuData =  data.map(
                record => Object.assign(
                { "Restaurant__r.Name" : record.Restaurant__r.Name},
                    record
                )
            );
        }
    }

    // Sort by Dish Rating

    defaultSortDirection = 'asc';
    sortDirection = 'asc';
    sortedBy;


    sortBy(field, reverse, primer) {
        const key = primer
            ? function (x) {
                  return primer(x[field]);
              }
            : function (x) {
                  return x[field];
              };

        return function (a, b) {
            a = key(a);
            b = key(b);
            return reverse * ((a > b) - (b > a));
        };
    }

    onHandleSort(event) {
        const { fieldName: sortedBy, sortDirection } = event.detail;
        const cloneData = [...this.menuData];

        cloneData.sort(this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1));
        this.menuData = cloneData;
        this.sortDirection = sortDirection;
        this.sortedBy = sortedBy;
    }
}