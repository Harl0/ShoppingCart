#!/bin/bash
#set -x

#Title: cart.sh
#Developer: Jason Harris
#Purpose: Software to provide shopping cart utility.
#Date: 02/04/2016
#Location: https://github.com/Harl0/ShoppingCart.git
#Initial Commit: 03/04/2016
#Version: 	0.1 - Inital
#			0.2 - Added common_procs and count_items function.
#			0.3 - Added cost_of_items and basket_total functions.
#			0.4 - Added step 2 requirements of special offers for apples and oranges.
#			0.5 - Added special offer switch to prove successful implementation.
#			1.0 - Baselined. Testing completed. 
#				  Removed comments and check_special_offer function as now superfluous.
#			2.0 - Refactored cost functions to reduce code duplication and improve scalability.

#set common values
. /Users/Jason/Documents/practice/DDCT/bin/common_procs.sh

function count_items {

while read line
do
	if [[ $line == "apple" ]]
	then
	   	let "apples_count=apples_count+1"
	else 
		if [[ $line == "orange" ]]
		then
	    	let "oranges_count=oranges_count+1"
	    fi       
	fi
done < $items

}

function cost_of_apples {

cost_of_items $apple_buy_ammount $apples_count $apple_value

apples_cost_to_customer=$cost_to_customer

}

function cost_of_oranges {	

cost_of_items $orange_buy_ammount $oranges_count $orange_value 

oranges_cost_to_customer=$cost_to_customer


}

function cost_of_items {	

if [ $special_offer == "ON" ]
then
	let "prime_value= $1 + 1"

	let "multipler= $2 / $prime_value"

	let "discount_to_bill= 1 * $multipler"

	let "total_to_bill= $2 - $discount_to_bill"

	let "cost_to_customer= $total_to_bill * $3"

else

	let "cost_to_customer= $2 * $3"

fi

}


function basket_total {
echo "##########"

    let "basket_grand_total=$apples_cost_to_customer + $oranges_cost_to_customer"

printf "Total: £%.2f" $(echo "scale=10;$basket_grand_total/100" | bc -l)
printf "\n"
echo "##########"

}

count_items
cost_of_apples
cost_of_oranges
basket_total

