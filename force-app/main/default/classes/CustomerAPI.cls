public class CustomerAPI {
    
    public static final String token = TokenUtility.getTokenByLabel('PTSAPIToken');
    public static void getCustomers (){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customerList.php?token='+token);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    public static void PostCustomer (){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody('{"firstName": "Baran","lastName": "Zeylan","email": "alazzey@gmail.com","phone": "9878985250","gender": "Male","status": "active"}');
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setMethod('POST');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    public static void PostCustomers (){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody('[{"firstName": "Adar","lastName": "Zeylan","email": "adarzeylani@gmail.com","phone": "5632104545","gender": "Male","status": "active"},{"firstName": "Meral","lastName": "Zeylan","email": "meralinko@gmail.com","phone": "4569878987","gender": "Female","status": "active"}]');
        
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setMethod('POST');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    public static void DeleteCustomer (){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?id=522&token='+token);
        request.setMethod('DELETE');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    
    public static void DeleteCustomerById (String customerId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?id='+customerId+'&token='+token);
        request.setMethod('DELETE');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    
    public static void PutCustomer (){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('PUT');
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody('{"id": "193","firstName": "Hasan","lastName": "Zeylan","email": "hasanzeylani@gmail.com","phone": "5632104545","gender": "Male","status": "active"}');
        
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    public static void PutCustomerById (String CustomerId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('PUT');
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody('{"id": "'+CustomerId+'","firstName": "Huseyin","lastName": "Zeylan","email": "huseyinzeylani@gmail.com","phone": "5632104545","gender": "Male","status": "active"}');
        
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    
      public static void PatchCustomer (){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('PATCH');
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody('{"id": "12","firstName": "Kenan","lastName": "Zeylan","email": "kenanzeylani@gmail.com","phone": "5632104545","gender": "Male","status": "active"}');
    
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    public static void PatchCustomerById (String customerId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('PATCH');
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody('{"id": "'+customerId+'","firstName": "Kenan","lastName": "Zeylan","email": "kenanzeylani@gmail.com","phone": "5632104545","gender": "Male","status": "active"}');
    
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
   public static void PostCustomersFromSR (){
       StaticResource sr = [Select id, body From StaticResource Where Name = 'CustomersPTS'];
       String payload = sr.body.toString();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody(payload);
        
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setMethod('POST');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }

    
   public static void PostCustomerFromRequstClass (){
       CustomerRequest customer = new CustomerRequest();
       customer.firstName = 'Cengiz';
       customer.lastName = 'Adibay';
       customer.email = 'cengiz@gmail.com';
       customer.gender = 'Male';
       customer.phone = '1234567890';
       customer.status = 'active';
       
       
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody(Json.Serialize(customer));
        
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setMethod('POST');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
   public static void PostCustomersFromRequstClass (){
       
       List<CustomerRequest> customerList = new List<CustomerRequest>();
       CustomerRequest customer1 = new CustomerRequest();
       customer1.firstName = 'Oguz';
       customer1.lastName = 'Sen';
       customer1.email = 'oguz@gmail.com';
       customer1.gender = 'Male';
       customer1.phone = '1234567890';
       customer1.status = 'active';

       CustomerRequest customer2 = new CustomerRequest();
       customer2.firstName = 'Nejdet';
       customer2.lastName = 'Can';
       customer2.email = 'nejdet@gmail.com';
       customer2.gender = 'Male';
       customer2.phone = '1234567890';
       customer2.status = 'active';
       
       customerList.add(customer1);
       customerList.add(customer2);

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody(Json.Serialize(customerList));
        
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setMethod('POST');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    public static void PostCustomerFromContacts (){
        
        List<Contact> conList = [Select Id, FirstName, LastName, Email, Phone From Contact];
        List<CustomerRequest> customerList = new List<CustomerRequest>();
        
        for (Contact con :conList){
            CustomerRequest customer = new CustomerRequest();
            customer.firstName = con.FirstName;
            customer.lastName = con.LastName;
            customer.email = con.Email;
            //customer.gender = con;
            customer.phone = con.Phone;
            customer.status = 'active';
            customerList.add(customer);  
            
        }
       
       
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
        request.setBody(Json.Serialize(customerList));
        
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setMethod('POST');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
    }
    @future(callout=true )
    public static void getCustomersbyResponse (){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customerList.php?token='+token);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
        
       List<CustomerResponse> customers = CustomerResponse.parse(response.getBody());
        
        List<Contact> conList = new List<Contact> ();
        for (CustomerResponse customer : customers){
            
            Contact con = new Contact();
            con.FirstName = customer.firstName;
            con.LastName = customer.lastName;
            con.Email = customer.email;
            con.Phone = customer.phone;
            
            conList.add(con);
        }        
        Database.insert(conList);
    }
  
}