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

count_items