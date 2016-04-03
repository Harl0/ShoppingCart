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
echo apples_count = $apples_count

if [ $special_offer == "ON" ]
then
	let "prime_value= $apple_buy_ammount + 1"
	echo prime_value = $prime_value

	let "multipler=$apples_count / $prime_value"
	echo multipler = $multipler

	let "discount_to_bill= 1 * $multipler"
	echo discount_to_bill = $discount_to_bill

	let "total_to_bill=$apples_count - $discount_to_bill"
	echo total_to_bill = $total_to_bill

	let "apple_cost_to_customer=$total_to_bill * $apple_value"
	echo apple_cost_to_customer = $apple_cost_to_customer

else

	let "apple_cost_to_customer=$apples_count * $apple_value"
	echo apple_cost_to_customer = $apple_cost_to_customer

fi
}

function cost_of_oranges {	
echo oranges_count = $oranges_count

if [ $special_offer == "ON" ]
then
	let "prime_value= $orange_buy_ammount + 1"
	echo prime_value = $prime_value

	let "multipler=$oranges_count / $prime_value"
	echo multipler = $multipler

	let "discount_to_bill= 1 * $multipler"
	echo discount_to_bill = $discount_to_bill

	let "total_to_bill=$oranges_count - $discount_to_bill"
	echo total_to_bill = $total_to_bill

	let "orange_cost_to_customer=$total_to_bill * $orange_value"
	echo orange_cost_to_customer = $orange_cost_to_customer

else

	let "orange_cost_to_customer=$oranges_count * $orange_value"
	echo orange_cost_to_customer = $orange_cost_to_customer

fi

}

function basket_total {
printf "\n"
echo "##########"
let "basket_grand_total=$apple_cost_to_customer + $orange_cost_to_customer"
printf "Total: £%.2f" $(echo "scale=10;$basket_grand_total/100" | bc -l)
printf "\n"
echo "##########"

}

function check_special_offer {

	echo special_offer=$special_offer

}

check_special_offer
count_items
cost_of_apples
cost_of_oranges
basket_total