import { LightningElement, wire } from 'lwc';
import getOpps from '@salesforce/apex/getRecs.getOpps';

export default class SearchOpps extends LightningElement {
    searchTerm;
    opps;
    // @wire(getOpps, {searchKey: '$searchTerm'}) opps;
    

    handleSearchTermChange(event) {
        
        this.searchTerm = event.target.value;
    }

    handleSearch(event){
        getOpps({searchKey: this.searchTerm})
        .then(result => {
            this.opps = result;
        })
        .catch(error => {
            console.log(error);
        });
    }
}