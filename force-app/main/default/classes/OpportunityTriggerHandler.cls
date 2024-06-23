public class OpportunityTriggerHandler {
    public static void calculateClosedWonOpps(List<Opportunity> listOpp, Map<id,Opportunity> mapOpp){
           set<String> idOpps = new set<String>();
        Id RecordTypeOppId = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Individual Guest').getRecordTypeId();
        for (Opportunity opp:listOpp){
            if(opp.IsWon && opp.StageName != mapOpp.get(opp.Id).StageName&& opp.RecordTypeId == RecordTypeOppId) {
			idOpps.add(opp.Id);
        } 

    }
    if (idOpps != null)
    {
    List<Opp_Guest_Intermediate__c> listInter = [Select Id, Guest__c From Opp_Guest_Intermediate__c Where Opportunity__c IN:idOpps];	 

}
}
}