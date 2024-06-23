@RestResource(urlMapping='/Account/*')
//@RestResource(urlMapping='/FieldCase/*') / Bunu Get metodu için kullandık.

global class RestCaseController {
    
    
    /*
@HTTPGET
global static List<Case> numberOfRelatedCases(){

String AccountName = RestContext.request.params.get('AccountName');
Account acc = [Select Id, Name From Account Where Name=:AccountName];

List<Case> relatedCases = [Select id From Case Where AccountId =:acc.Id];

return relatedCases;

}
*/
    
    
    
    @HTTPPOST
    
    global static String createNewAccount(String AccountName){
        
        Account acc= new Account();
        acc.Name = AccountName;
        
        insert acc;
        return 'New Account has been created.';
    }
    
    @HTTPPATCH
    global static String updateAnAccount( String accId, String AccountSite){
        
        Account acc = [SELECT id, Name, Site From Account Where id=:accId];
        acc.Site = AccountSite;
        
        update acc;
        return 'An account has been updated';
    }
    
    @HTTPDELETE
    global static String DeleteAnAccount(){
        
        String accId = RestContext.request.params.get('AccountId');
        Account acc = [SELECT id From Account Where id=:accId];
        
        delete acc;
        return 'An account has been deleted';
    }
}