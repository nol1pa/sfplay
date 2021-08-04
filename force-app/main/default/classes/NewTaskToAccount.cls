public with sharing class NewTaskToAccount {

    //List<Task> tskList = new List<Task>();

    @InvocableMethod(label='Create new Task' description='Create new task when new Account is added' category='Account')
    public static void createTask(List<Account> accList){
        List<Task> tskList = new List<Task>();
        for(Account accObj : accList){
            if (accObj.Name != null) {
                Task tsk = new Task();
                tsk.Subject = 'Neogotiations with ' + accObj.Name;
                tsk.OwnerId = accObj.OwnerId;
                tsk.WhatId = accObj.Id;
                tskList.add(tsk);                
            }
        }
        if (tskList != null && tskList.size()>0) {
            insert tskList;
        }
    }
}