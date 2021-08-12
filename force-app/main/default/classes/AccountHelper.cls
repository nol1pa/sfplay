public class AccountHelper {
    
    @future
    public static void addNewtaskInFuture(){  
        Task task = new Task(
            Subject = 'This task from future',
            Status = 'Not Started',
        	Is_Synced__c = false);
        insert task;
    }
    
    public static void checkBillingAddress(List<Account> newAccList, Map<Id, Account> oldAccMap){
        Account oldAccs;
        for (Account newAccs : newAccList){
            oldAccs = oldAccMap.get(newAccs.id);
            if (newAccs.BillingStreet != oldAccs.BillingStreet){
                Set<Id> setAccId = new set<Id>();
                setAccId.add(newAccs.Id);
                setToContactsCheckboxes(setAccId);
            }
        }
    }
    
    @future
    public static void setToContactsCheckboxes(Set<Id> accId){
        List<Contact> record = [SELECT Id, Is_Synced__c, Updated_By_Future__c, Account.BillingAddress, AccountId FROM Contact WHERE AccountId in :accID];
        for (Contact cont : record){
            cont.Is_Synced__c = false;
            cont.Updated_By_Future__c = true;
        }
        update record;
    }
    
    public static void logWhoWorked(){
        if (Trigger.isBefore){
            if (Trigger.isInsert){
                System.debug(' before insert ');
            }
            if (Trigger.isUpdate){
                System.debug(' before update ');
            }
            if (Trigger.isDelete){
                System.debug(' before delete ');
            }
        } else if (Trigger.isAfter){
            if (Trigger.isInsert){
                System.debug(' after insert ');
            }
            if (Trigger.isUpdate){
                System.debug(' after update ');
            }
            if (Trigger.isDelete){
                System.debug(' after delete ');
            }
            if (Trigger.isUndelete){
                System.debug(' aftere undelete ');
            }
        }
    }
}