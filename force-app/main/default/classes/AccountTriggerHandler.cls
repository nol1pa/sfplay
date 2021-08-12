public class AccountTriggerHandler {
    
    public static void handleBeforeInsert(List<Account> newList){
        AccountHelper.logWhoWorked();
        AccountHelper.addNewtaskInFuture();
    }
    
    public static void handleBeforeUpdate(List<Account> newList, Map<Id, Account> newMap, List<Account> oldList, Map<Id, Account> oldMap){
        AccountHelper.logWhoWorked();
    }
    
    public static void handleBeforeDelete(List<Account> oldList, Map<Id, Account> oldMap){
        AccountHelper.logWhoWorked();
    }
    
    public static void handleAfterInsert(List<Account> newList, Map<Id, Account> newMap){
        AccountHelper.logWhoWorked();
    }
    
    public static void handleAfterUpdate(List<Account> newList, Map<Id, Account> newMap, List<Account> oldList, Map<Id, Account> oldMap){
        AccountHelper.checkBillingAddress(newList, oldMap);
        System.enqueueJob(new AccountQueueableHelper(oldMap, newList));
        AccountHelper.logWhoWorked();
    }
    
    public static void handleAfterDelete(List<Account> oldList, Map<Id, Account> oldMap){
        AccountHelper.logWhoWorked();
    }
    
    public static void handleAfterUndelete(List<Account> newList, Map<Id, Account> newMap){
        AccountHelper.logWhoWorked();
    }

}