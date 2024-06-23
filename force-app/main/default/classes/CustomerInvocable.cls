public class CustomerInvocable {
	
    @InvocableMethod(label='Get Customers')
    public static void CallAPI(){
        
        CustomerAPI.getCustomersbyResponse();
    }
}