public class PTSUser {
    
    public static final String EndPoint = 'https://api.pathtosalesforce.com/JSON/user.php';
    public static void getUser(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(EndPoint);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
        NewContact newCon = (NewContact)System.Json.deserialize(response.getBody(),NewContact.class);
        system.debug(newCon);
        
        Contact newContact = new Contact();
        newContact.FirstName = newCon.firstName;
        newContact.LastName =newCon.lastName;
        newContact.Email =newCon.email;
        
        insert newContact;
            
    }
    
    public class NewContact{
        public string firstName;
        public string lastName;
        public string email;
        
    }
}