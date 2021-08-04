trigger ProteinFoodCheckerTrigger on Food__c (before insert, before update) {
    if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            ProteinCheckerHandler.ProteinCheckerMethod(trigger.new);
        }
    }	
}