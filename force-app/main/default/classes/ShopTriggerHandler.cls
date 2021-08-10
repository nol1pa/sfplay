public class ShopTriggerHandler {
    
    public static void handleBeforeInsert(List<Shop__c> newList){
        ShopHelper.logWhoWorked();
    }
    
    public static void handleBeforeUpdate(List<Shop__c> newList, Map<Id, Shop__c> newMap, List<Shop__c> oldList, Map<Id, Shop__c> oldMap){
        ShopHelper.logWhoWorked();
    }
    
    public static void handleBeforeDelete(List<Shop__c> oldList, Map<Id, Shop__c> oldMap){
        ShopHelper.logWhoWorked();
    }
    
    public static void handleAfterInsert(List<Shop__c> newList, Map<Id, Shop__c> newMap){
        ShopHelper.logWhoWorked();
    }
    
    public static void handleAfterUpdate(List<Shop__c> newList, Map<Id, Shop__c> newMap, List<Shop__c> oldList, Map<Id, Shop__c> oldMap){
        ShopHelper.logWhoWorked();
    }
    
    public static void handleAfterDelete(List<Shop__c> oldList, Map<Id, Shop__c> oldMap){
        ShopHelper.logWhoWorked();
    }
    
    public static void handleAfterUndelete(List<Shop__c> newList, Map<Id, Shop__c> newMap){
        ShopHelper.logWhoWorked();
    }

}