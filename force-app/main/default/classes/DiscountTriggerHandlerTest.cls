@isTest
public class DiscountTriggerHandlerTest {
    @testSetup
    static void setupTestData() {
        // Create test data for opportunities
        Opportunity opp1 = new Opportunity(Name = 'Test Opportunity 1', StageName = 'Prospecting', CloseDate = Date.today(), Amount = 10000);
        Opportunity opp2 = new Opportunity(Name = 'Test Opportunity 2', StageName = 'Prospecting', CloseDate = Date.today(), Amount = 20000);
        insert new List<Opportunity>{opp1, opp2};

        // Create test data for discounts
        Discount__c discount1 = new Discount__c(Opportunity__c = opp1.Id, Discount_Type__c = 'Raw Amount', Discount_Amount__c = 1000);
        Discount__c discount2 = new Discount__c(Opportunity__c = opp2.Id, Discount_Type__c = 'Percent', Discount_Amount__c = 10);
        insert new List<Discount__c>{discount1, discount2};
    }

    @isTest
    static void testCalculateDiscounts() {
        // Fetch the test data
        Opportunity opp1 = [SELECT Id, Amount FROM Opportunity WHERE Name = 'Test Opportunity 1' LIMIT 1];
        Opportunity opp2 = [SELECT Id, Amount FROM Opportunity WHERE Name = 'Test Opportunity 2' LIMIT 1];
        
        // Create new discount records
        Discount__c discountRaw = new Discount__c(Opportunity__c = opp1.Id, Discount_Type__c = 'Raw Amount', Discount_Amount__c = 500);
        Discount__c discountPercent = new Discount__c(Opportunity__c = opp2.Id, Discount_Type__c = 'Percent', Discount_Amount__c = 15);

        // Insert the discount records to trigger the handler
        insert new List<Discount__c>{discountRaw, discountPercent};

        // Fetch the discounts to verify the calculations
        Discount__c insertedDiscountRaw = [SELECT Net_Discount__c FROM Discount__c WHERE Opportunity__c = :opp1.Id AND Discount_Type__c = 'Raw Amount' LIMIT 1];
        Discount__c insertedDiscountPercent = [SELECT Net_Discount__c FROM Discount__c WHERE Opportunity__c = :opp2.Id AND Discount_Type__c = 'Percent' LIMIT 1];

        // Validate the results
        System.assertEquals(500, insertedDiscountRaw.Net_Discount__c, 'Raw amount discount calculation is incorrect.');
        System.assertEquals(3000, insertedDiscountPercent.Net_Discount__c, 'Percent discount calculation is incorrect.'); // 15% of 20000 is 3000
    }
}