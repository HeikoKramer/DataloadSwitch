import { LightningElement, wire, api } from 'lwc';

/******************
 * APEX METHODS
 ******************/
import getValidationRule from '@salesforce/apex/DataloadSwitchController.getValidationRule';

export default class ToogleValidationRule extends LightningElement {
    @api checked = '';
    @api buttonDisabled = false;
    @api rowId;

    

    handleToggle(event) {
        console.log('>>>ToogleValidationRule -- handleToggle.');

        const event = CustomEvent('selectedrec', {
            composed: true,
            bubbles: true,
            cancelable: true,
            detail: {
                rowId: this.rowId,
            },
        });
        this.dispatchEvent(event);
    }

    get getInactiveMsg(){
        return this.buttonDisabled?'Disabled':'Not Selected';
    }
}