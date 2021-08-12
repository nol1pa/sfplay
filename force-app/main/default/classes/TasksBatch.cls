public class TasksBatch implements Database.Batchable<sObject>, Database.Stateful{
    public Integer numberOfProcessedRecords = 0;
    public Integer numberOfBatch = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Is_Synced__c, WhatId, Account_Owner__c, Account.Updated_By_Task__c, Account.OwnerId, Account.Name FROM Task');
    }
    
    public void execute(Database.BatchableContext bc, List<Task> tasks){
        for (Task tsk : tasks){
            tsk.Account_Owner__c = tsk.Account.Name;
            tsk.Is_Synced__c = true;
            tsk.Account.Updated_By_Task__c = true;
            numberOfProcessedRecords = numberOfProcessedRecords + 1;
        }
        update tasks;
        numberOfBatch = numberOfBatch + 1;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Number Of Records ' + numberOfProcessedRecords);
        System.debug('Number Of Batch ' + numberOfBatch);
    }

}