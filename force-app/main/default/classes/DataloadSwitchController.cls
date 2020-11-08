/**
* @purpose: Controller for dataloadSwitch.lwc to controll data flow.
*
* @author:  <Christian Schwabe> (Christian.Schwabe@gmx.com)
*
* @history:
* version                   | author                                | changes
* ====================================================================================
* 0.1 01.11.2020            | Christian.Schwabe@gmx.com             | inital version
*/
public inherited sharing class DataloadSwitchController {
    public DataloadSwitchController() {

    }

    @AuraEnabled(cacheable=true)
    public static ToolingApiWrapper getAllValidationRules()
    {
        return DataloadSwitchService.getAllValidationRules();
    }

    /**
     * @todo: Not yet finished. Missing parameter validationRuleId.
     * 
     * getValidationRule description
     * @param  toolingApiWrapper toolingApiWrapper description
     * @return                 return description
     */
    @AuraEnabled(cacheable=true)
    public static String toogleValidationRule(Id validationRuleId, Boolean state)
    {
        System.debug('-------------------- BEGIN CALL toogleValidationRule(validationRuleId: ' + validationRuleId + ', state: ' + state + ') --------------------');

        return DataloadSwitchService.toogleValidationRule(validationRuleId, state);
    }
}
