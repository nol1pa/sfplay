public class AccountBatchableAnon implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Is_Synced__c, MailingAddress, MailingStreet, Account.BillingStreet, Account.Updated_By_Contact__c FROM Contact');
    }
    
    public void execute(Database.BatchableContext bc, List<Contact> contacts){
        for (Contact cont : contacts){
            cont.MailingStreet = cont.Account.BillingStreet;
            cont.Is_Synced__c = true;
            cont.Account.Updated_By_Contact__c = true;
        }
        update contacts;
    }
    
    public void finish(Database.BatchableContext bc){
        
    }

}