public class AccountFutureAnon {
    
    public static void checkBillingAddress(){
        List<Account> accList = [SELECT Id, Name, BillingStreet, BillingAddress FROM Account LIMIT 150];
        for (Account acc : accList){
            if (acc.BillingAddress != null){
                Set<Id> setAccId = new set<Id>();
                setAccId.add(acc.Id);
                setToContactsIsSyncedTrue(setAccId);
            }
        }
    }
    
    @future
    public static void setToContactsIsSyncedTrue(Set<Id> accId){
        List<Contact> record = [SELECT Id, Is_Synced__c, Updated_By_Future__c, Account.BillingAddress, AccountId FROM Contact WHERE AccountId in :accID];
        for (Contact cont : record){
            cont.Is_Synced__c = false;
            cont.Updated_By_Future__c = true;
        }
        update record;     
    }
    
}