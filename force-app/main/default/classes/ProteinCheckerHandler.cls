public class ProteinCheckerHandler {
    public static void ProteinCheckerMethod(List<Food__c> newFood){
       for(Food__c food : newFood){
			Boolean ProteinChecker = food.ProteinCheck__c >= 20.0;
        	Boolean AgeChecker = food.AgeCheck__c >= 9;
			if (AgeChecker == true && ProteinChecker == false){
            	food.adderror('You must choose food with protein 20g or more. Increase the portion or choose other product.');
        	}
        	else{
            
        	}  
        }
        
    }
}