import { LightningElement } from 'lwc';

/******************
 * CUSTOM LABELS
 ******************/
import labels from './labels';

export default class DataloadSwitchNavigationMenu extends LightningElement {
    labels = labels;

    /******************
     * EVENT HANDLER
     ******************/

    /**
     * Is fired when on lightning-vertical-navigation-item is clicked.
     * Detail contains the name of 
     * 
     * @param {Event} event
     */
    handleSelect(event)
    {
        console.log('>>>DataloadSwitchNavigationMenu -- handleSelect');
        console.log('>event.detail: ' + JSON.stringify(event.detail, null, '\t'));
        const nameOfNavigationItem = event.detail.name;

        const clickEvent = new CustomEvent('verticalnavigationitemselect', { detail: nameOfNavigationItem });
        this.dispatchEvent(clickEvent);
    }
}