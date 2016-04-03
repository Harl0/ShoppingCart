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

#set common values
. /Users/Jason/Documents/practice/DDCT/bin/common_procs.sh

function count_items {

while read line
do
	if [[ $line == "apple" ]]
	then
	    echo "Found apple"
	    let "apples_count=apples_count+1"
	    echo "Found apple, count now:" $apples_count
	else 
		if [[ $line == "orange" ]]
		then
	    let "orange_count=orange_count+1"
	    echo "Found orange, count now:" $orange_count
	    fi       
	fi
done < $items

}

function cost_of_items {

	let "apple_cost_to_customer= $apples_count * $apple_value"
	echo $total_apple_cost

	let "orange_cost_to_customer= $orange_count * $orange_value"
	echo $total_orange_cost

}

function basket_total {
	printf "\n"
	echo "##########"

		let "basket_grand_total=$apple_cost_to_customer + $orange_cost_to_customer"

	printf "Total: £%.2f" $(echo "scale=10;$basket_grand_total/100" | bc -l)
	printf "\n"
	echo "##########"

}

count_items
cost_of_items
basket_total