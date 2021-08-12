public class TasksSchedule implements Schedulable{
    
    public void execute(SchedulableContext ctx){
        TasksBatch taskBatch = new TasksBatch();
        database.executeBatch(taskBatch);
    }

}