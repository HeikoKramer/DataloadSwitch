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
        { label: 'Active', fieldName: 'active', type: 'toggleButton',
            typeAttributes: { 
                rowId: { fieldName: 'id' },
                manageableState: { fieldName: 'manageableState' },
            }
        },
        { label: 'Validation Name', fieldName: 'validationName' },
        { label: 'Id', fieldName: 'id' },
        { label: 'Description', fieldName: 'description' },
        { label: 'Entity Definition Id', fieldName: 'entityDefinitionId' },
        { label: 'Error Display Field', fieldName: 'errorDisplayField' },
        { label: 'Error Message', fieldName: 'errorMessage' },
        { label: 'Last Modified By', fieldName: 'userUrl', type: 'url', typeAttributes: { tooltip: { fieldName: 'userName' }, label: { fieldName: 'userName' } }, sortable: true },
        { label: 'Last Modified Date', fieldName: 'lastModifiedDate', type: 'date' },
        
        //{ label: 'Manageable State', fieldName: 'manageableState' },
        //{ label: 'Namespace Prefix', fieldName: 'namespacePrefix' },
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
            console.log('>error: ' + error);
            this.error = error;
            this.records = undefined;
        }
    }

    /******************
     * EVENT HANDLER
     ******************/
    /*handleSelectedRec(event){
        console.log('>>>DataloadSwitchValidationRules -- handleSelectedRec.');
        const { rowId } = event.detail;

        console.log('>rowId: ' + JSON.stringify(rowId, null, '\t'));
    }*/

    /******************
     * HELPER FUNCTIONS
     ******************/
     preprocessData(value)
     {
        console.log('>>>DataloadSwitchValidationRules -- preprocessData.');

        let data = JSON.parse(JSON.stringify(value));
        data.forEach(row => {
            let userId = (row.lastModifiedBy && row.lastModifiedBy.Id ? row.lastModifiedBy.Id : null);
            row.userName = (row.lastModifiedBy && row.lastModifiedBy.Name ? row.lastModifiedBy.Name : null);
            row.userUrl = '/lightning/r/User/' + userId + '/view';
        });
        console.log('>data: ' + JSON.stringify(data, null, '\t'));

        return data;
     }
}