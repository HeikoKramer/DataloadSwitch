public inherited sharing class ToolingApiCallout extends RestClient {
    private static final String TOOLING_API_URL = '/services/data/v48.0/tooling/query/?q=';
    
    private HttpResponse httpResponse;

   /**
     * @description Constructor accepting a named credential.
     * @param  namedCredential name of the Named Credetial to use
     */
    public ToolingApiCallout(String namedCredential) {
        super(namedCredential);
    }

    public ToolingApiCallout getValidationRule(Id validationRuleId)
    {
        System.debug('-------------------- BEGIN CALL getValidationRule(validationRuleId: ' + validationRuleId + ') --------------------');

        //EntityDefinition
        String query = 'SELECT Id, Metadata, FullName FROM ValidationRule WHERE Id = \'' + validationRuleId + '\'';
        makeCallout(TOOLING_API_URL, query);

        System.debug('-------------------- END CALL getValidationRule(this: ' + this + ') --------------------');
        return this;
    }

    public ToolingApiCallout getAllValidationRules()
    {
        System.debug('-------------------- BEGIN CALL getAllValidationRules() --------------------');
        String query = 'SELECT Id, Active, Description, EntityDefinitionId, ErrorDisplayField, ErrorMessage, ManageableState, NamespacePrefix, ValidationName FROM ValidationRule';
        makeCallout(TOOLING_API_URL, query);

        System.debug('-------------------- END CALL getAllValidationRules(this: ' + this + ') --------------------');

        return this;
    }

    public String rawOutput()
    {
        return this.httpResponse.getBody();
    }

    /**
     * @description convenience method for a GET Call that only requires a path and query.
     * 
     * @param path   Http path component of the URL. ie: `/path/to/resource`
     * @param query  Query component of the URL ie: after `?foo=bar`
     * @return     `HTTPResponse`
     */
    private ToolingApiCallout makeCallout(String path, String query)
    {
        System.debug('-------------------- BEGIN CALL makeCallout(path: ' + path + ', query: ' + query + ') --------------------');
        // Perform a REST callout to our REST endpoint
        // using our named credential.
        HttpResponse httpResponse = get(path, query);
        System.debug('>>>httpResponse: ' + httpResponse);

        // Get the body from our HttpResponse
        String responseBody = httpResponse.getBody();
        System.debug('>>>responseBody: ' + responseBody);

        this.httpResponse = httpResponse;
        
        return this;
    }
}
