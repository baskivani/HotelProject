public class TokenUtility {
    public static string getTokenByLabel(String label){
    TokenList__mdt myToken = TokenList__mdt.getInstance(label);
    
    return myToken.token__c;
        }

}