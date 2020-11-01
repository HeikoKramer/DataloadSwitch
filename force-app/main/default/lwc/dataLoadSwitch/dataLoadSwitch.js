import { LightningElement, track } from 'lwc';

export default class DataLoadSwitch extends LightningElement {

    /*****************************
     * PRIVATE REACTIVE PROPERTIES
     *****************************/
    @track currentContent;

    /******************
     * EVENT HANDLER
     ******************/
    /**
     * Is triggerd when a click is executed on child comöonent c-dataload-switch-navigation-menu.
     * @param {CustomEvent} event
     */
    handleVerticalNavigationItemcSelect(event)
    {
        console.log('>>>DataLoadSwitch -- handleVerticalNavigationItemcSelect');
        console.log('>event.detail: ' + JSON.stringify(event.detail, null, '\t'));
        this.currentContent = event.detail;

        /*switch (nameOfNavigationItem) {
            case 'validationRules':

                break;
        
            default:
                break;
        }*/
    }

    /******************
     * TEMPLATE
     ******************/
    get showValidationRules()
    {
        return this.currentContent === 'validationRules';
    }
}