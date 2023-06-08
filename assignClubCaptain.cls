public class assignClubCaptain {
    
    @AuraEnabled
    
    Public Static List<Players__c> getPlayerList(Id selectedIdFromLWc)
    {
        List<Players__c> PlayerList = [Select Id, Name, Goals__c, Football_Club__c from Players__c where Football_Club__c =: selectedIdFromLWc];
        
        if(!PlayerList.isEmpty()){
            
            return PlayerList;
            
        }
        return null;
    }
    
    @AuraEnabled
    
    Public Static Boolean assignClubCaptain( Id lwcRowId)
    {
        
        List<Football_Club__c> clubList = new List<Football_Club__c>();
        List<Players__c> PlayerListForAssignement =[Select id, name , Football_Club__c from Players__c where id =:lwcRowId ];
        if(!PlayerListForAssignement.isEmpty())
        {
            
            for(Players__c playerObj : PlayerListForAssignement)
            {
                Football_Club__c clubObj = new Football_Club__c();
                
                //clubObj.id = playerObj.Football_Club__c;
                clubObj.Captains__c=playerObj.id;
                clubList.add(clubObj);
                
            }
        }
        if(!clubList.isEmpty())
        {
upsert clubList;
            return true;
        }
        return false;
    }

}