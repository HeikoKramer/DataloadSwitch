/**
* @purpose: Controller for dataloadSwitch.lwc to controll data flow.
* @todo: Outsource deseralizaton.
* 
* @author:  <Christian Schwabe> (Christian.Schwabe@gmx.com)
*
* @history:
* version                   | author                                | changes
* ====================================================================================
* 0.1 01.11.2020            | Christian.Schwabe@gmx.com             | inital version
*/
public inherited sharing class DataloadSwitchService {

    public static ToolingApiValidationRule getAllValidationRules(String namedCredential)
    {
        String responseBody = new ToolingApiCallout(namedCredential).getAllValidationRules().rawOutput();

        try {
            // Attempt to deserialize our response body into ToolingApiValidationRule.
            ToolingApiValidationRule toolingApiValidationRule = (ToolingApiValidationRule) JSON.deserialize(
                responseBody,
                ToolingApiValidationRule.class
            );

            return toolingApiValidationRule;
        } catch (JSONException e) {
            // If the deserialization fails, we can debug it using a JSON Exception
            System.debug(
                LoggingLevel.INFO,
                'Failed to deserialize the body. Error is: ' + e.getMessage()
            );
        }

        return null;
    }

    public static toolingApiValidationRule getValidationRule(Id validationRuleId)
    {
        String responseBody = new ToolingApiCallout('ToolingApi').getValidationRule(validationRuleId).rawOutput();

        /*{
            "size":1,
            "totalSize":1,
            "done":true,
            "queryLocator":null,
            "entityTypeName":"ValidationRule",
            "records":[
                {
                    "attributes":{
                        "type":"ValidationRule",
                        "url":"/services/data/v48.0/tooling/sobjects/ValidationRule/03d2X000000KBm1QAG"
                    },
                    "Id":"03d2X000000KBm1QAG",
                    "Metadata":{
                        "description":null,
                        "errorConditionFormula":"AND( ISPICKVAL(CHANNEL_ORDERS__Pricing_Type__c ,\"FIXED\"),ISNULL(  CHANNEL_ORDERS__Fixed_Price__c ))",
                        "errorDisplayField":"CHANNEL_ORDERS__Fixed_Price__c",
                        "errorMessage":"Fixed Price is required if Pricing Type = FIXED",
                        "shouldEvaluateOnClient":null,
                        "urls":null,
                        "active":true
                    },
                    "FullName":"CHANNEL_ORDERS__Partner_Product_Catalog__c.CHANNEL_ORDERS__Fixed_Price_is_required"
                }
            ]
        }*/

        try {
            // Attempt to deserialize our response body into ToolingApiValidationRule.
            ToolingApiValidationRule toolingApiValidationRule = (ToolingApiValidationRule) JSON.deserialize(
                responseBody,
                ToolingApiValidationRule.class
            );

            return toolingApiValidationRule;
        } catch (JSONException e) {
            // If the deserialization fails, we can debug it using a JSON Exception
            System.debug(
                LoggingLevel.INFO,
                'Failed to deserialize the body. Error is: ' + e.getMessage()
            );
        }

        return null;
    }
}
