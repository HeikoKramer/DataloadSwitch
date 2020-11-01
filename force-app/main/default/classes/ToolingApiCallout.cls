public inherited sharing class ToolingApiCallout extends RestClient {
   /**
     * @description Constructor accepting a named credential.
     * @param  namedCredential name of the Named Credetial to use
     */
    public ToolingApiCallout(String namedCredential) {
        super(namedCredential);
    }

    public String getRawOutput()
    {
        // Perform a REST callout to our custom REST endpoint
        // 'IntegrationService' using our named credential.
        // this callout uses the default named credential that's set when this
        // class was instantiated.

        //EntityDefinition, Metadata, FullName
        String query = 'SELECT Id, Active, Description, EntityDefinitionId, ErrorDisplayField, ErrorMessage, ManageableState, NamespacePrefix, ValidationName FROM ValidationRule WHERE Active = true';//.replace(' ', '+');
        HttpResponse response = get('/services/data/v48.0/tooling/query/?q=', query);
        System.debug('>>>response: ' + response);

        // Get the body from our HttpResponse
        String responseBody = response.getBody();
        System.debug('>>>responseBody: ' + responseBody);
        
       
        // System.Url.getOrgDomainUrl() // gets the org's base URL
        // System.UserInfo.getSessionId() // In async context will now always return a valid session ID for active users
        return responseBody;
    }
}
