
 global class DMLUtility implements Database.Batchable<SObject> , Database.stateful
 {

global Database.querylocator start(Database.Batchablecontext bx)
{

    global set<id> allFailedId=new set<id>();
string query='Select id, name , Active__c from account';
return database.getQueryLocator(query);
}

global void execute(Database.BatchableContext bx , list<account>scope)
{
List<account>acclist = new List<Account>();
for(Account ac : scope)
{
ac.Active__c='Yess';
acclist.add(ac);
}
List<Database.SaveResult>result =database.update(acclist,false);
for(Database.SaveResult rs :result )
{
if(rs.isSuccess())
{
System.debug('Successfully insert the record' + rs.getId());

}
else {
    
List<Database.Error> err1 = rs.getErrors();
for(Database.Error er : err1)
{

    system.debug('List the error reocrd'+er.getFields());
    allFailedId.add(rs.getId());
}
}


}

}

 }
    
 
