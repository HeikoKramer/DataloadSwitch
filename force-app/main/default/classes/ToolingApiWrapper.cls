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
public inherited sharing class ToolingApiWrapper {

    @AuraEnabled public Integer size {get;set;}
    @AuraEnabled public Integer totalSize {get;set;}
    @AuraEnabled public Boolean done {get;set;}
    @AuraEnabled public String entityTypeName {get;set;}
    @AuraEnabled public List<ValidationRule> records {get;set;}

    public class ValidationRule {
        public ValidationRule(){}

        @AuraEnabled public Attributes attributes {get;set;}

        @AuraEnabled public Id id {get;set;}
        @AuraEnabled public String validationName {get;set;}
        @AuraEnabled public Boolean active {get;set;}
        @AuraEnabled public String description {get;set;}
        @AuraEnabled public String namespacePrefix {get;set;}
        @AuraEnabled public String manageableState {get;set;}
        @AuraEnabled public String createdById {get;set;}
        @AuraEnabled public String createdDate {get;set;}
        @AuraEnabled public String lastModifiedById {get;set;}
        @AuraEnabled public User lastModifiedBy {get;set;}

        @AuraEnabled public String lastModifiedDate {get;set;}

        @AuraEnabled public Metadata metadata {get;set;}
        
        @AuraEnabled public String fullName {get;set;}
        @AuraEnabled public String entityDefinitionId {get;set;}
        @AuraEnabled public String errorDisplayField {get;set;}
        @AuraEnabled public String errorMessage {get;set;}
        
    }

    public class Metadata {
        @AuraEnabled public String description {get;set;}
        @AuraEnabled public String errorConditionFormula {get;set;}
        @AuraEnabled public String errorDisplayField {get;set;}
        @AuraEnabled public String errorMessage {get;set;}
        @AuraEnabled public Boolean shouldEvaluateOnClient {get;set;}
        @AuraEnabled public String urls {get;set;}
        @AuraEnabled public Boolean active {get;set;}
    }

    public class PatchValidationRule {
        @AuraEnabled public PatchMetadata metadata {get;set;}
    }

    public class PatchMetadata {
        public PatchMetadata() {}

        @AuraEnabled public Boolean active {get;set;}
        @AuraEnabled public String errorConditionFormula {get;set;}
        @AuraEnabled public String errorMessage {get;set;}
        
    }


    public class Attributes {
        @AuraEnabled public String type {get;set;}
        @AuraEnabled public String url {get;set;}
    }
}
