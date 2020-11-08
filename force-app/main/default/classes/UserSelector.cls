/**
* @purpose: Selector Class for User.
* 
* @author:  <Christian Schwabe> (Christian.Schwabe@gmx.com)
*
* @history:
* version                   | author                                | changes
* ====================================================================================
* 0.1 08.11.2020            | Christian.Schwabe@gmx.com             | inital version
*/
public inherited sharing class UserSelector {
    /**
     * Select by User.Id
     * 
     * @param  Set<String>     - setOfUserId contains User.Id
     * @return List<User>
     */
    public static List<User> selectByUserId(Set<Id> setOfUserId){
        System.debug('-------------------- BEGIN CALL UserSelector -- selectByUserId(setOfUserId: ' + setOfUserId + ') --------------------');

        List<User> listOfUser = new List<User>(
            [
                SELECT
                    Id, Name
                FROM
                    User
                WHERE
                    Id = :setOfUserId
            ]
        );
        
        
        System.debug('-------------------- END CALL UserSelector -- selectByUserId(listOfUser: ' + listOfUser + ') --------------------');

        return listOfUser;
    }

    /**
     * Convert to Map of User by Id.
     * 
     * @param  Set<String>     - setOfUserId contains User.Id
     * @return Map<Id, User> Key: User.Id, Value: User
     */
    public static Map<Id, User> getMapOfUserById(Set<Id> setOfUserId){
        System.debug('-------------------- BEGIN CALL UserSelector -- selectByUserId(setOfUserId: ' + setOfUserId + ') --------------------');
        
        Map<Id, User> mapOfUserById = (Map<Id, User>) CollectionUtils.idMapFromCollectionByKey('Id', selectByUserId(setOfUserId));

        System.debug('-------------------- END CALL UserSelector -- selectByUserId(mapOfUserById: ' + mapOfUserById + ') --------------------');

        return mapOfUserById;
    }
}
