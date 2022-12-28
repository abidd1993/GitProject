import { LightningElement, wire } from 'lwc';
import getCons from '@salesforce/apex/getRecs.getRecsMethod';

export default class SessionLWC extends LightningElement {
    @wire(getCons) conList;
}