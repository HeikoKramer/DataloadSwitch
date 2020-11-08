/**
* @purpose: Workaround to serialize unserializeable objects.
* @resource: https://salesforce.stackexchange.com/questions/12255/write-a-generic-json-serializable-parameters-class-without-hitting-apex-type-un
*
* @author:  <Christian Schwabe> (Christian.Schwabe@gmx.com)
*
* @history:
* version                   | author                                | changes
* ====================================================================================
* 0.1 08.11.2020            | Christian.Schwabe@gmx.com             | inital version
*/

public inherited sharing class Parameters {
    private Map<String, Object> parameters = new Map<String, Object>();

    public void add(String name, Object value) {
        this.parameters.put(name, value);
    }

    public Object get(String name) {
        Object result = null;

        if(this.parameters.containsKey(name)) {
            result = this.parameters.get(name);
        }
        return result;
    }

    public String serialize()
    {
        return JSON.serialize(parameters);      
    }

    public static Parameters deserialize(String serialized)
    { 
        Parameters parameters = new Parameters();
        parameters.parameters = (Map<String, Object>) JSON.deserializeUntyped(serialized);
        return parameters;
    }
}
