public class test {

    @AuraEnabled
    //@AuraEnabled
    //@AuraEnabled
    //@AuraEnabledaaaaaaaaa
    public static List<Contact> getlist( id getselectedrow)
        //public static List<Contact> getlist( id getselectedrow)
    {
        
        List<Contact> Getrecord = [Select Accountid , name  from Contact where accountid =: getselectedrow];

Return Getrecord;
    }
    
     @AuraEnabled

    Public static boolean assingvalue( id rowid)
{

List<Account> records = new List<Account>();
List<Contact> getcontact = [Select id ,name from Contact where id = :rowid ];
if(!getcontact.isempty())
{
for(Contact ctobj : getcontact )
{
Account act  = new Account();
act.id='0015i000009AgieAAC';
records.add(act);
}

}
if(!records.isempty())
{
upsert records;
return true;
}
return false;
}

}
