import { LightningElement, wire, track } from 'lwc';

/******************
 * APEX METHODS
 ******************/
import getAllValidationRules from '@salesforce/apex/DataloadSwitchController.getAllValidationRules';


export default class DataloadSwitchValidationRules extends LightningElement {

    @track records;

    /******************
     * WIRE ADAPTER
     ******************/
    @wire(getAllValidationRules)
    getAllValidationRules({ error, data }) {
        console.log('>>>DataloadSwitchValidationRules -- getAllValidationRules.');

        if (data) {
            console.log('>data: ' + JSON.stringify(data, null, '\t'));

            this.records = data.records;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.records = undefined;
        }
    }

}