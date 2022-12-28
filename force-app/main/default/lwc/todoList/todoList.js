import { LightningElement, track } from 'lwc';

export default class TodoList extends LightningElement {

    @track todoItem;
    @track todoValue;
    @track todoList = [];
    @track doneTasks = [];

    taskChange(event) {
        this.todoItem = event.target.value;
        this.todoValue = this.todoItem.toUpperCase();
        console.log(this.todoValue);
    }

    handleAdd() {
        let listLength = this.todoList.length;

        var valtodo = this.template.querySelector(".validate");

        if(this.todoList.includes(this.todoValue)) {
            valtodo.setCustomValidity("Task already exists");
            valtodo.reportValidity();
        } 
        else if (this.todoValue != '') {
            this.todoList.push(this.todoValue);
            this.todoItem = '';
            valtodo.setCustomValidity("");
            valtodo.reportValidity();
        } 
        else {
            valtodo.setCustomValidity("Please name your Task");
            valtodo.reportValidity();
        }
    }
    
    handleDone(event) {

        console.log(event.target.value);
        console.log(event.target.id);
        let task = event.target.value;
        this.doneTasks.push(task);
        this.todoList = this.todoList.filter(item => item !== task);
    }
    
    handleReset(event) {
        this.todoItem='';
    };
}