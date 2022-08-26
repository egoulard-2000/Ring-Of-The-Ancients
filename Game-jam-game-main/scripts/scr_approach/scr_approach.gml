function scr_approach(current_amount,target_amount,rate){

/****************************************
 Increments a value by a given shift but 
 never beyond the end value
 ****************************************/

if (current_amount < target_amount)
    return min(current_amount + rate, target_amount); 
else
    return max(current_amount - rate, target_amount);

}