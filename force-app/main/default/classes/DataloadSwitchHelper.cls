/**
* @purpose: Helper for Service class for dataloadSwitch.lwc.
* 
* @author:  <Christian Schwabe> (Christian.Schwabe@gmx.com)
*
* @history:
* version                   | author                                | changes
* ====================================================================================
* 0.1 08.11.2020            | Christian.Schwabe@gmx.com             | inital version
*/
public inherited sharing class DataloadSwitchHelper {

    /**
     * Is used to add user information (i.e. name).
     * @param  toolingApiWrapper toolingApiWrapper description
     */
    public static void addInformation(ToolingApiWrapper toolingApiWrapper)
    {
        Set<Id> setOfUserId = new Set<Id>();
        for(ToolingApiWrapper.ValidationRule validationRule : toolingApiWrapper.records)
        {
            setOfUserId.add(validationRule.LastModifiedById);
        }

        Map<Id, User> mapOfUserById = UserSelector.getMapOfUserById(setOfUserId);

        for(ToolingApiWrapper.ValidationRule validationRule : toolingApiWrapper.records)
        {
            Id lastModifiedById = validationRule.LastModifiedById;
            validationRule.lastModifiedBy = mapOfUserById.containsKey(lastModifiedById) ? mapOfUserById.get(lastModifiedById) : null;
            setOfUserId.add(validationRule.LastModifiedById);
        }
    }
}
