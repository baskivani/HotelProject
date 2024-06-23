public class PTSLeadCreation {
    
    public static final String EndPoint = 'https://api.pathtosalesforce.com/JSON/user.php';
    public static void GetLead(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(EndPoint);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
        NewLead newLead = (NewLead)System.Json.deserialize(response.getBody(),NewLead.class);
        system.debug(newLead);
        
        Lead led = new Lead();
        led.FirstName = newLead.firstName;
        led.LastName =newLead.lastName;
        led.Email =newLead.email;
        
        insert led;
            
    }
    
    public class NewLead{
        public string firstName;
        public string lastName;
        public string email;
        
    }
}