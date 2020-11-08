import { LightningElement, wire, api } from 'lwc';

/******************
 * MODULES
 ******************/
import { reduceErrors } from 'c/lwcUtil';
//import { notifyUser } from 'c/toastMessageHelper';
//import { notifyUserWithMessageData } from 'c/toastMessageHelper';

/******************
 * APEX METHODS
 ******************/
import toogleValidationRule from '@salesforce/apex/DataloadSwitchController.toogleValidationRule';


export default class ToogleValidationRule extends LightningElement {
    @api checked;
    @api rowId;
    @api manageableState;

    /******************
     * HELPER FUNCTIONS
     ******************/
    handleToogleValidationRule()
    {
        console.log('>>>ToogleValidationRule -- handleToogleValidationRule.');
        
        toogleValidationRule({ validationRuleId: this.rowId, state: this.checked })
            .then(result => {
                //console.log('>result: ' + JSON.stringify(result, null, '\t'));
                const httpResponse = JSON.parse(result);
                console.log('>httpResponse: ' + JSON.stringify(httpResponse, null, '\t'));
                const statusCode = Number(httpResponse.statusCode);
                console.log('>statusCode: ' + JSON.stringify(statusCode, null, '\t'));


                this.handleResponse(httpResponse);
                //this.records = data.records;//this.preprocessData(data.records);
                //this.error = undefined;
            })
            .catch(error => {
                console.error('>error: ' + JSON.stringify(error, null, '\t'));
                //this.error = error;
                //this.records = undefined;
            })
    }


    /******************
     * HELPER FUNCTIONS
     ******************/
    handleResponse(httpResponse)
    {
        const body = JSON.parse(httpResponse.body);
        console.log('>body: ' + JSON.stringify(body, null, '\t'));

        //reduceErrors
    }

    /******************
     * TEMPLATE
     ******************/
    get buttonDisabled()
    {
        return this.manageableState !== 'unmanaged' ? true : false;
    }

    /******************
     * EVENT HANDLER
     ******************/
    handleToggle(event)
    {
        console.log('>>>ToogleValidationRule -- handleToggle.');
        console.log('>event.detail: ' + JSON.stringify(event.detail, null, '\t'));
        this.checked = event.detail.checked;

        this.handleToogleValidationRule();
        /*const clickEvent = CustomEvent('selectedrec', {
            composed: true,
            bubbles: true,
            cancelable: true,
            detail: {
                rowId: this.rowId,
            },
        });
        this.dispatchEvent(clickEvent);*/
    }

    /******************
     * EVENT HANDLER
     ******************/
}