public class DiscountTriggerHandler {
    public static void calculateDiscounts(List<Discount__c> discountList) {
        Set<Id> opportunityIds = new Set<Id>();

        // Collect Opportunity IDs
        for (Discount__c discount : discountList) {
            if (discount.Opportunity__c != null) {
                opportunityIds.add(discount.Opportunity__c);
            }
        }

        // Fetch related opportunities
        Map<Id, Opportunity> opportunityMap = new Map<Id, Opportunity>(
            [SELECT Id, Amount FROM Opportunity WHERE Id IN :opportunityIds]
        );

        // Process each discount record
        for (Discount__c discount : discountList) {
            if (discount.Opportunity__c != null && discount.Discount_Type__c != null) {
                Opportunity opp = opportunityMap.get(discount.Opportunity__c);
                if (opp != null) {
                    if (discount.Discount_Type__c == 'Raw Amount') {
                        discount.Net_Discount__c	 = discount.Discount_Amount__c;
                    } else if (discount.Discount_Type__c == 'Percent') {
                        discount.Net_Discount__c = (discount.Discount_Amount__c / 100) * opp.Amount;
                    }
                }
            }
        }
    }
}