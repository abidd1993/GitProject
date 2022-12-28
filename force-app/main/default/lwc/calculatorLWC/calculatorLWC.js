import { LightningElement, track } from 'lwc';

export default class CalculatorLWC extends LightningElement {
    firstNumber;
    secondNumber;
    operator;
    result;
    @track resultArray = [];

    handleFirstNumberChange(event) {
        this.firstNumber = event.target.value;
    }

    handleSecondNumberChange(event) {
        this.secondNumber = event.target.value;
    }

    handleAdd(event) {
        this.result = parseInt(this.firstNumber) + parseInt(this.secondNumber);
        this.operator = '+';
        let itrValue = this.firstNumber + this.operator + this.secondNumber + '=' + this.result;
        this.resultArray.push(itrValue);
    }

    handleSubtract(event) {
        this.result = parseInt(this.firstNumber) - parseInt(this.secondNumber);
        this.operator = '-';
        let itrValue = this.firstNumber + this.operator + this.secondNumber + '=' + this.result;
        this.resultArray.push(itrValue);
    }

    handleMultiply(event) {
        this.result = parseInt(this.firstNumber) * parseInt(this.secondNumber);
        this.operator = '*';
        let itrValue = this.firstNumber + this.operator + this.secondNumber + '=' + this.result;
        this.resultArray.push(itrValue);
    }

    handleDivide(event) {
        this.result = parseInt(this.firstNumber) / parseInt(this.secondNumber);
        this.operator = '/';
        let itrValue = this.firstNumber + this.operator + this.secondNumber + '=' + this.result;
        this.resultArray.push(itrValue);
    }
    
    handleClear(event) {
        this.firstNumber = '';
        this.secondNumber = '';
        this.result = '';
        this.operator = '';
        this.resultArray = [];
    }
}