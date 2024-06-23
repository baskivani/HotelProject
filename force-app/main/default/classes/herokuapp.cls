public class herokuapp {
    
    public static final String Endpoint= 'https://th-apex-http-callout.herokuapp.com/animals';
    
    public static void getAnimals(){
     
        HTTP http = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
         system.debug(response.getBody());

        if( response.getStatusCode()==200){
         Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());  
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal: animals) {
                System.debug(animal);
            }
        }
    }
    
   public static void postAnAnimal(){
     
        HTTP http = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Endpoint);
        request.setMethod('POST');
       request.setBody('{"name":"Goat"}');
        request.setHeader('Content-Type','application/json;charset=UTF-8');

        HttpResponse response = http.send(request);
       if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
    }
  
}