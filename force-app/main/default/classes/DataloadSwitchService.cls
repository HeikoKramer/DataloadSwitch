/**
* @purpose: Service class for dataloadSwitch.lwc to convert data into a correct structure.
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

    private static final String NAMED_CREDENTIAL = 'ToolingApi';

    public static ToolingApiWrapper getAllValidationRules()
    {
        ToolingApiWrapper toolingApiWrapper;
        String responseBody = new ToolingApiCallout(NAMED_CREDENTIAL).getAllValidationRules().rawOutput();

        try {
            // Attempt to deserialize our response body into ToolingApiWrapper.
            toolingApiWrapper = (ToolingApiWrapper) JSON.deserialize(
                responseBody,
                ToolingApiWrapper.class
            );
            DataloadSwitchHelper.addInformation(toolingApiWrapper);
            
            System.debug('>>>toolingApiWrapper: ' + toolingApiWrapper);
        } catch (JSONException e) {
            // If the deserialization fails, we can debug it using a JSON Exception
            System.debug(
                LoggingLevel.INFO,
                'Failed to deserialize the body. Error is: ' + e.getMessage()
            );
        }


        return toolingApiWrapper;
    }

    public static ToolingApiWrapper getValidationRule(Id validationRuleId)
    {
        String responseBody = new ToolingApiCallout(NAMED_CREDENTIAL).getValidationRule(validationRuleId).rawOutput();

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
            // Attempt to deserialize our response body into ToolingApiWrapper.
            ToolingApiWrapper toolingApiWrapper = (ToolingApiWrapper) JSON.deserialize(
                responseBody,
                ToolingApiWrapper.class
            );

            return toolingApiWrapper;
        } catch (JSONException e) {
            // If the deserialization fails, we can debug it using a JSON Exception
            System.debug(
                LoggingLevel.INFO,
                'Failed to deserialize the body. Error is: ' + e.getMessage()
            );
        }

        return null;
    }

    /**
     * toogleValidationRule description
     * @todo:
     * Expception handling, i. e. incorrect id, found more than one validation rule. 
     * It is not possible to change state.
     * 
     * @param  validationRuleId validationRuleId description
     * @param  state            state description
     * @return                  return description
     */
    public static String toogleValidationRule(Id validationRuleId, Boolean state)
    {
        ToolingApiWrapper.ValidationRule currentValidationRule = getValidationRule(validationRuleId).records.get(0);
        ToolingApiWrapper.PatchValidationRule newValidationRule = new ToolingApiWrapper.PatchValidationRule();
        newValidationRule.metadata = new ToolingApiWrapper.PatchMetadata();
        newValidationRule.metadata.errorConditionFormula = currentValidationRule.metadata.errorConditionFormula;
        newValidationRule.metadata.errorMessage = currentValidationRule.metadata.errorMessage;
        newValidationRule.metadata.active = state;
        System.debug('>newValidationRule: ' + newValidationRule);

        // Attempt to serialize the request body to send in the request.
        String requestBody = JSON.serialize(newValidationRule);
        System.debug('>requestBody: ' + requestBody);

        HttpResponse httpResponse = new ToolingApiCallout(NAMED_CREDENTIAL).toogleValidationRule(validationRuleId, requestBody).getHttpResponse();
        System.debug('>httpResponse: ' + httpResponse);

        return serializeHttpResponse(httpResponse);
    }

    private static String serializeHttpResponse(HttpResponse httpResponse)
    {
        Parameters parameters = new Parameters();
        parameters.add('body', httpResponse.getBody());
        parameters.add('status', httpResponse.getStatus());
        parameters.add('statusCode', String.valueOf(httpResponse.getStatusCode()));
        
        return parameters.serialize();
    }
}
