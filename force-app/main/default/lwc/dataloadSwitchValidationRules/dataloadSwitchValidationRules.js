import { LightningElement, wire } from 'lwc';
// Adapted With big respect to devlive.tech: https://devlife.tech/lwc/how-to-create-a-custom-column-in-datatable-lwc/

/******************
 * APEX METHODS
 ******************/
import getAllValidationRules from '@salesforce/apex/DataloadSwitchController.getAllValidationRules';

   
/******************
 * DATATABLE COLUMNS
 ******************/
    const COLUMNS = [
        { label: 'Id', fieldName: 'id' },
        { label: 'Active', fieldName: 'active', type: 'toggleButton',
            typeAttributes: { 
                buttonDisabled: { fieldName: 'isDisabled' }, 
                rowId: { fieldName: 'id' }, 
            }
        },

        //{ label: 'Active', fieldName: 'active', type: 'boolean' },

        { label: 'Description', fieldName: 'description' },
        { label: 'Entity Definition Id', fieldName: 'entityDefinitionId' },
        { label: 'Error Display Field', fieldName: 'errorDisplayField' },
        { label: 'Error Message', fieldName: 'errorMessage' },
        { label: 'Manageable State', fieldName: 'manageableState' },
        { label: 'Namespace Prefix', fieldName: 'namespacePrefix' },
        { label: 'Validation Name', fieldName: 'validationName' },
    ];
export default class DataloadSwitchValidationRules extends LightningElement {
    columns = COLUMNS;
    records;

    /******************
     * WIRE ADAPTER
     ******************/
    @wire(getAllValidationRules)
    getAllValidationRules({ error, data }) {
        console.log('>>>DataloadSwitchValidationRules -- getAllValidationRules.');

        if (data) {
            console.log('>data: ' + JSON.stringify(data, null, '\t'));

            this.records = this.preprocessData(data.records);
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.records = undefined;
        }
    }

    /******************
     * EVENT HANDLER
     ******************/
    handleSelectedRec(event){
        console.log('>>>DataloadSwitchValidationRules -- handleSelectedRec.');
        const { rowId } = event.detail;

        console.log('>rowId: ' + JSON.stringify(rowId, null, '\t'));
    }

    /******************
     * HELPER FUNCTIONS
     ******************/
     preprocessData(value)
     {
        console.log('>>>DataloadSwitchValidationRules -- preprocessData.');

        let data = JSON.parse(JSON.stringify(value));
        data.forEach(row => {
            row.recordId = row.id;
        });
        console.log('>data: ' + JSON.stringify(data, null, '\t'));

        return data;
     }
}