trigger ShopTrigger on Shop__c (
    	before insert,
		before update,
		before delete,
		after insert,
		after update,
		after delete,
		after undelete) {
        
        if (Trigger.isBefore && Trigger.isInsert){
            ShopTriggerHandler.handleBeforeInsert(Trigger.new);
        }
        
        if (Trigger.isBefore && Trigger.isUpdate){
            ShopTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
        }
        
        if (Trigger.isBefore && Trigger.isDelete){
            ShopTriggerHandler.handleBeforeDelete(Trigger.old, Trigger.oldMap);
        }
        
        if (Trigger.isAfter && Trigger.isInsert){
            ShopTriggerHandler.handleAfterInsert(Trigger.new, Trigger.newMap);
        }
        
        if (Trigger.isAfter && Trigger.isUpdate){
            ShopTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
        }
        
        if (Trigger.isAfter && Trigger.isDelete){
            ShopTriggerHandler.handleAfterDelete(Trigger.old, Trigger.oldMap);
        }
        
        if (Trigger.isAfter && Trigger.isUndelete){
            ShopTriggerHandler.handleAfterUndelete(Trigger.new, Trigger.newMap);
        }
}