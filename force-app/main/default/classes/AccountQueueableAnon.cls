public class AccountQueueableAnon {
    public Account acc;
    
    public AccountQueueableAnon(Account acc){
        this.acc = new Account();
        if(acc != null){
            this.acc = acc;
        }
    }
    
    public void execute(QueueableContext QB){
        Set<Id> setAccId = new set<Id>();
        setAccId.add(acc.Id);
        if (acc.BillingAddress != null){
            List<Contact> record = [SELECT Id, Is_Synced__c, Updated_By_Queue__c, Account.BillingAddress, AccountId FROM Contact WHERE AccountId in :setAccId];
            for (Contact con : record){
                con.Is_Synced__c = false;
                con.Updated_By_Queue__c = true;
            }
            update record;
        }
    }
}