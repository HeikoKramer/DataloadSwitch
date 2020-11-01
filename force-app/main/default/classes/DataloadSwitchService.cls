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
public inherited sharing class DataloadSwitchService {

    public static ToolingApiValidationRule getAllValidationRules(String namedCredential)
    {
        String responseBody = new ToolingApiCallout(namedCredential).getRawOutput();
        System.debug('>>>responseBody: ' + responseBody);

        try {
            // Attempt to deserialize our response body into a list of Accounts
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
