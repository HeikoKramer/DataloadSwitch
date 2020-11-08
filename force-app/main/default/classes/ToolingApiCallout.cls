public inherited sharing class ToolingApiCallout extends RestClient {
    private static final String TOOLING_API_QUERY_URL = '/services/data/v48.0/tooling/query/?q=';
    private static final String TOOLING_API_VALIDATION_RULE_URL = '/services/data/v48.0/tooling/sobjects/ValidationRule/';
    private HttpResponse httpResponse;


   /**
     * @description Constructor accepting a named credential.
     * @param  namedCredential name of the Named Credential to use
     */
    public ToolingApiCallout(String namedCredential) {
        super(namedCredential);
    }

    public ToolingApiCallout getValidationRule(Id validationRuleId)
    {
        System.debug('-------------------- BEGIN CALL getValidationRule(validationRuleId: ' + validationRuleId + ') --------------------');

        //EntityDefinition
        String query = 'SELECT Id, Metadata, FullName FROM ValidationRule WHERE Id = \'' + validationRuleId + '\'';
        makeGetCallout(TOOLING_API_QUERY_URL, query);

        System.debug('-------------------- END CALL getValidationRule(this: ' + this + ') --------------------');
        return this;
    }

    public ToolingApiCallout getAllValidationRules()
    {
        System.debug('-------------------- BEGIN CALL getAllValidationRules() --------------------');
        String query = 'SELECT Id, CreatedById, CreatedDate, LastModifiedById, LastModifiedDate, Active, Description, EntityDefinitionId, ErrorDisplayField, ErrorMessage, ManageableState, NamespacePrefix, ValidationName FROM ValidationRule';
        return makeGetCallout(TOOLING_API_QUERY_URL, query);
    }

    public ToolingApiCallout toogleValidationRule(Id validationRuleId, String body)
    {
        /**
         * @description convenience method for a PATCH Call that only requires a
         * path and body
         * @param path   Http path component of the URL. ie: `/path/to/resource`
         * @param body   JSON string to post
         * @return     `HTTPResponse`
         */
        String path = TOOLING_API_VALIDATION_RULE_URL + validationRuleId;
        return makePatchCallout(path, body);
    }


    public String rawOutput()
    {
        return this.httpResponse?.getBody();
    }

    public HttpResponse getHttpResponse()
    {
        return this.httpResponse;
    }
    
    /*public String status()
    {
        return this.httpResponse?.getStatus();
    }*/

    private ToolingApiCallout makePatchCallout(String path, String body)
    {
        System.debug('-------------------- BEGIN CALL makePatchCallout(path: ' + path + ', body: ' + body + ') --------------------');
        // Perform a REST callout to our REST endpoint
        // using our named credential.
        HttpResponse httpResponse = patch(path, body);
        System.debug('>>>httpResponse: ' + httpResponse);

        // Get the body from our HttpResponse
        String responseBody = httpResponse.getBody();
        System.debug('>>>responseBody: ' + responseBody);

        this.httpResponse = httpResponse;

        return this;
    }

    /**
     * @description convenience method for a GET Call that only requires a path and query.
     * 
     * @param path   Http path component of the URL. ie: `/path/to/resource`
     * @param query  Query component of the URL ie: after `?foo=bar`
     * @return     `HTTPResponse`
     */
    private ToolingApiCallout makeGetCallout(String path, String query)
    {
        System.debug('-------------------- BEGIN CALL makeGetCallout(path: ' + path + ', query: ' + query + ') --------------------');
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
