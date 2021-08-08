public with sharing class ThreeTaskUnited {

    @InvocableMethod(label='Three Tasks united' description='Union tasks when amount of their is three or more' category='Account')
    public static void unitedTasks(List<Account> accList){
        
        Id tempId;
        
        for (Account accObj : accList){
            tempId = accObj.Id;
        } 
        
        List<Task> tskList = [Select Id, status, WhatId FROM TASK WHERE OwnerId != null];
        List<User> userList = [SELECT Id FROM User WHERE IsActive = TRUE];
        AggregateResult[] groupedResults = [SELECT COUNT(CreatedById), WhatId  FROM Task GROUP BY WhatId HAVING COUNT(WhatId) > 3 AND WhatId = :tempId];
        
        for (AggregateResult ar : groupedResults)  {
            for(Task taskObj : tskList){
                if(taskObj.WhatId == (string)ar.get('WhatId')){
                    taskObj.OwnerId = userList[3].Id;
                }
            }                
		}
        update tskList;
	}
}