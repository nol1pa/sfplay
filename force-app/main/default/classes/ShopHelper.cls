public with sharing class ShopHelper {
    private static Boolean checkSingle = true;
    
    public static void logWhoWorked(){
        if (Trigger.isBefore){
            if (Trigger.isInsert && checkSingle){
                System.debug(' before insert ');
                checkSingle = false;
            }
            if (Trigger.isUpdate && checkSingle){
                System.debug(' before update ');
                checkSingle = false;
            }
            if (Trigger.isDelete && checkSingle){
                System.debug(' before delete ');
                checkSingle = false;
            }
        } else if (Trigger.isAfter){
            if (Trigger.isInsert && checkSingle){
                System.debug(' after insert ');
                checkSingle = false;
            }
            if (Trigger.isUpdate && checkSingle){
                System.debug(' after update ');
                checkSingle = false;
            }
            if (Trigger.isDelete && checkSingle){
                System.debug(' after delete ');
                checkSingle = false;
            }
            if (Trigger.isUndelete && checkSingle){
                System.debug(' aftere undelete ');
                checkSingle = false;
            }
        }
    }
}