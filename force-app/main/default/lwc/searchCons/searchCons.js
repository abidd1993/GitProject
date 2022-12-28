import { api, LightningElement, wire } from 'lwc';
import getCons from '@salesforce/apex/getRecs.getCons';

export default class SearchCons extends LightningElement {
    @api recordId;
    searchTerm;
    @wire(getCons, {searchKey: '$searchTerm'}) contacts;
    

    handleSearchTermChange(event) {
        if(event.target.value !== ""){
            this.searchTerm = event.target.value;
        }
        
    }
}