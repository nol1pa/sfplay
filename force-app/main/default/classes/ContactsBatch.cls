public class ContactsBatch implements Database.Batchable<sObject>, Database.Stateful{
    public Integer numberOfProcessedRecords = 0;
    public Integer numberOfBatch = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Is_Synced__c, MailingAddress, MailingStreet, Account.BillingStreet, Account.Updated_By_Contact__c FROM Contact');
    }
    
    public void execute(Database.BatchableContext bc, List<Contact> contacts){
        for (Contact cont : contacts){
            cont.MailingStreet = cont.Account.BillingStreet;
            cont.Is_Synced__c = true;
            cont.Account.Updated_By_Contact__c = true;
            numberOfProcessedRecords = numberOfProcessedRecords + 1;
        }
        update contacts;
        numberOfBatch = numberOfBatch + 1;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Number Of Records ' + numberOfProcessedRecords);
        System.debug('Number Of Batch ' + numberOfBatch);
    }

}