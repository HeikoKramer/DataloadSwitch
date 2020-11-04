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
    public static ToolingApiValidationRule getAllValidationRules(String namedCredential)
    {
        namedCredential = 'ToolingApi';
        return DataloadSwitchService.getAllValidationRules(namedCredential);
    }

    /**
     * @todo: Not yet finished. Missing parameter validationRuleId.
     * 
     * getValidationRule description
     * @param  namedCredential namedCredential description
     * @return                 return description
     */
    @AuraEnabled(cacheable=true)
    public static ToolingApiValidationRule getValidationRule(String namedCredential)
    {
        namedCredential = 'ToolingApi';
        //return DataloadSwitchService.getValidationRule(namedCredential);
        return null;
    }
}
