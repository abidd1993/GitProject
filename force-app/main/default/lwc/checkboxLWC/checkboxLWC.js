import { LightningElement } from 'lwc';

export default class CheckboxLWC extends LightningElement {
    textToDisplay = "Checkbox is checked";
    
    handlechange(event) {
        var isChecked = event.target.checked;
        console.log(isChecked);
        if(isChecked) {
            this.textToDisplay = "Checkbox is checked";
        } else {
            this.textToDisplay = "Checkbox is unchecked";
        }
    }
}