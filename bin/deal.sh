#!/bin/bash

buy_ammount=1
offer_ammount=1
basket_ammount=3
item_ammount=1

let "prime_value= $buy_ammount + $offer_ammount"

echo prime_value = $prime_value

let "multipler=$basket_ammount / $prime_value"

echo multipler = $multipler

let "discount_to_bill=$offer_ammount * $multipler"

echo discount_to_bill = $discount_to_bill

let "total_to_bill=$basket_ammount - $discount_to_bill"

echo total_to_bill = $total_to_bill

let "cost_to_customer=$total_to_bill * $item_ammount"

echo cost_to_customer = $cost_to_customer

echo " "
value=`printf "%.1f" $(echo "scale=$item_ammount;$basket_ammount/$prime_value" | bc)`
echo " "

echo $value

deal_desicion=`echo $value | awk -F"." {'print $2'}`
echo $deal_desicion

if [ $deal_desicion -ge 5 ]
	then
	    echo "You should increase the number of apples in your basket to make the most of the bogof offer..."
fi