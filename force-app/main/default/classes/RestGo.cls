public with sharing class RestGo {
 
    @AuraEnabled
    public static Void GetUsers(String Gender, String Status){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users?gender='+Gender+'&status='+Status);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
       List<user> ulist = (List<user>) System.JSON.deserialize(response.getBody(), List<user>.class);
        
        System.debug(ulist);
        
        List<Account> acList = new List<Account>();
        
        for(user u : uList){
            
            Account ac = new Account(Name=u.name);
            acList.add(ac);
            
        }
        
        insert acList;
        
    }     
    

    
    public class user{
        public String Id;
        public String Name;
        public String Email;
        public String Status;
        public String Gender;
    }
}