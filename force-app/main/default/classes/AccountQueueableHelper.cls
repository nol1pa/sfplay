public class AccountQueueableHelper implements Queueable {
    private List<Account> newAccList;
    private Map<Id, Account> oldAccMap;
    
    public AccountQueueableHelper(Map<Id, Account> oldMap, List<Account> newList){
        this.newAccList = newList;
        this.oldAccMap = oldMap;
    }
    
    public void execute(QueueableContext QB){
        Set<Id> setAccId = new set<Id>();
        Account oldAccs;
        for (Account newAccs : newAccList){
            oldAccs = oldAccMap.get(newAccs.id);
            if(newAccs.BillingStreet != oldAccs.BillingStreet){
                setAccId.add(newAccs.Id);
            }
        }
        List<Contact> record = [SELECT Id, Is_Synced__c, Updated_By_Queue__c, Account.BillingAddress, AccountId FROM Contact WHERE AccountId in :setAccId];
            for (Contact con : record){
                con.Is_Synced__c = false;
                con.Updated_By_Queue__c = true;
            }
        update record;
    }
}