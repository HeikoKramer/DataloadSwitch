/**
* @purpose: A wrapper class for the response from Tooling API.
*
* @author:  <Christian Schwabe> (Christian.Schwabe@gmx.com)
*
* @history:
* version                   | author                                | changes
* ====================================================================================
* 0.1 01.11.2020            | Christian.Schwabe@gmx.com             | inital version
*/
public inherited sharing class ToolingApiValidationRule {

    @AuraEnabled public Integer size {get;set;}
    @AuraEnabled public Integer totalSize {get;set;}
    @AuraEnabled public Boolean done {get;set;}
    @AuraEnabled public List<ValidationRule> records {get;set;}

    public class ValidationRule {
        @AuraEnabled public Id id {get;set;}
        @AuraEnabled public Boolean active {get;set;}
        @AuraEnabled public String description {get;set;}
        @AuraEnabled public String entityDefinitionId {get;set;}
        @AuraEnabled public String errorDisplayField {get;set;}
        @AuraEnabled public String errorMessage {get;set;}
        @AuraEnabled public String manageableState {get;set;}
        @AuraEnabled public String namespacePrefix {get;set;}
        @AuraEnabled public String validationName {get;set;}
        @AuraEnabled public Metadata metadata {get;set;}
    }

    public class Metadata {
        
    }
}
