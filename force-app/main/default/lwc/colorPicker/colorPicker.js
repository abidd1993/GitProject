import { LightningElement } from 'lwc';

export default class ColorPicker extends LightningElement {
    get colors() {
        return [
            { label: 'Red', value: 'Red' },
            { label: 'Green', value: 'Green' },
            { label: 'Blue', value: 'Blue' },
            { label: 'Yellow', value: 'Yellow' },
            { label: 'Black', value: 'Black' }
        ];
    }
    colorName="";
    
    handleColorChange(event) {
        this.colorName = event.detail.value;
    }
}