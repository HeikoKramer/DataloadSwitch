import LightningDatatable from 'lightning/datatable';
import toggleButtonColumnTemplate from './toggleButtonColumnTemplate.html';

export default class DataloadSwitchValidationRulesTable extends LightningDatatable {
    static customTypes = {
        toggleButton: {
            template: toggleButtonColumnTemplate,
            standardCellLayout: true,
            typeAttributes: ['rowId', 'manageableState'],
        },
    };
}