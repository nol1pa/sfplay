public class ContactsSchedule implements Schedulable{
    
    public void execute(SchedulableContext ctx){
        ContactsBatch contactBatch = new ContactsBatch();
        database.executeBatch(contactBatch);
    }

}