public with sharing class DataConroller {
    @AuraEnabled(Cacheable=true)
    
public static List<Contact> getcontactdetail()
{

    return [Select id, name from contact];
}


}