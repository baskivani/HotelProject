public class CustomerResponse {
    
    public string firstName;
    public string lastName;
    public string email;
    public string  phone;
    public string gender;
    public string status;
    
    public static List<CustomerResponse> parse (String json){
        
        return (List<CustomerResponse>) System.JSON.deserialize(json, List<CustomerResponse>.class);
    }

}