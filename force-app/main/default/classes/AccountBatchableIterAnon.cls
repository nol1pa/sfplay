public class AccountBatchableIterAnon implements Database.Batchable<sObject>{
    
    public Iterable<sObject> start(Database.BatchableContext bc){
        return [SELECT Id, Is_Synced__c, MailingAddress, MailingStreet, MailingCountry, MailingCity, Account.BillingStreet, Account.BillingCountry, Account.BillingCity, Account.Updated_By_Contact__c FROM Contact];
    }
    
    public void execute(Database.BatchableContext bc, List<Contact> contacts){
        for (Contact cont : contacts){
            cont.MailingStreet = cont.Account.BillingStreet;
            cont.MailingCountry = cont.Account.BillingCountry;
            cont.MailingCity = cont.Account.BillingCity;
            cont.Is_Synced__c = true;
            cont.Account.Updated_By_Contact__c = true;
        }
        update contacts;
    }
    
    public void finish(Database.BatchableContext bc){
        
    }

}