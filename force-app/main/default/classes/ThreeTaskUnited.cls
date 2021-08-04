public with sharing class ThreeTaskUnited {

    @InvocableMethod(label='Three Tasks united' description='Union tasks when amount of their is three or more' category='Account')
    public static void unitedTasks(List<Account> accList){      
        
        List<Task> tskList = [Select Id, status, WhatId FROM TASK WHERE OwnerId != null];
        
        List<User> userList = [SELECT Id FROM User WHERE Id = '0055g00000AV0jN' OR Id = '0055g00000ARGc8'];        
        
        List<AggregateResult> newTask = [SELECT COUNT(CreatedById), WhatId  FROM Task GROUP BY WhatId HAVING COUNT(WhatId) > 3];
       
        AggregateResult[] groupedResults = [SELECT COUNT(CreatedById), WhatId  FROM Task GROUP BY WhatId HAVING COUNT(WhatId) > 3];
        
        string getRandomId = userList.get(Math.floor( Math.random() * userList.size() ).intValue()).id;
        
        for (AggregateResult ar : groupedResults)  {
            if ((integer)ar.get('expr0') > 3){
                Task taskIdSet = new Task();
                taskIdSet.WhatId = (string)ar.get('WhatId');
                for(Task taskObj : tskList){
                    if(taskObj.WhatId == taskIdSet.WhatId){
                        taskObj.OwnerId = getRandomId;    
                    }
                }                
            }
		}
        
        
       /* for(Integer i=0; i < newTask.size(); i++){
            if((integer)newTask[i].get('expr0') > 3){                
                //Task tsk = new Task();
                //tsk.OwnerId = userList[0].Id;
                Task taskIdSet = new Task();
                taskIdSet.WhatId = (string)newTask[i].get('WhatId');
                //tskList.add(tsk);
                for(Task taskObj : taskList){
                    if(taskObj.WhatId == taskIdSet.WhatId){
                        Task task = new Task();
                        task.Id = taskObj.Id;
                        task.WhatId = taskObj.WhatId;
                        task.Subject = taskObj.Subject;
                        task.OwnerId = userList[0].Id;
                        task.Priority = taskObj.Priority;
                        task.Status = taskObj.Status;
                        tskList.add(task);
                    }
                }
            }
        }      */
        
        //if (tskList != null && tskList.size()>0) {
            update tskList;
        //}
	}
}