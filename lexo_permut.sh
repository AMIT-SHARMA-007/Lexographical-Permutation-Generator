#!/bin/bash

echo "ENter the number of nos u want to find the lexicographic permutation ofenter: "
read tot
tot2=1
array_length=$tot
#factorial finder:
while [ $tot -ge 1 ]
do
tot2=`expr $tot2 \* $tot`
tot=`expr $tot - 1`
done
#echo ""$tot2
#factorial finder ends
temp=0
i=0
while [ $i -lt $array_length ]
do
echo "Enter" `expr $i + 1` "number: "
read temp
array[$i]=$temp
i=`expr $i + 1`
done

: '
#printing array portion
i=0
while [ $i -lt $array_length ]
do
echo "${array[$i]}"
i=`expr $i + 1`
done
#printing array portion ends
'
i=0
while [ $i -lt $array_length ]
do
	echo -n "${array[$i]}"
	i=`expr $i + 1`

done
echo "" 
i=0
tot2=`expr $tot2 - 1`
while [ $i -lt $tot2 ]
do
	flag=0
	j=`expr $array_length - 1`
	while [ $j -gt 0 ]
	do
		temp=`expr $j - 1` 
		
		if [[ ${array[$j]} -gt ${array[$temp]} ]]
		
		then
			flag=1
			break
		fi	
	j=`expr $j - 1`
	done
	#j=3 in case u enter 4 numbers, All ascending obv.
			
	k=0
	jtemp=`expr $j - 1`
	while [ $k -lt $jtemp ]
	do
		echo -n "${array[$k]}"	
		k=`expr $k + 1`
	done
	l=$j
	temp=0
	while [ $l -lt $array_length ]
	do
		arraysorted[$temp]=${array[$l]}
		temp=`expr $temp + 1`
		l=`expr $l + 1`
		
	done 
	
	temp2=0
	while [ $temp2 -lt $temp ]
	do
		
		temp3=`expr $temp2 + 1`
		tempno=0
		while [ $temp3 -lt $temp ]
		do
		
			if [[ ${arraysorted[$temp3]} -lt ${arraysorted[$temp2]} ]]
			then
			
				tempno=${arraysorted[$temp2]}
				arraysorted[$temp2]=${arraysorted[$temp3]}
				arraysorted[$temp3]=$tempno
		
			fi	
		temp3=`expr $temp3 + 1`
		
		done 
	
	temp2=`expr $temp2 + 1`
		
	done 
	arraysorted_length=$temp
	
	temp=0
	temp2=`expr $j - 1`
	tempno=0
	while [ $temp -lt $arraysorted_length ]
	do
	
		if [[ ${arraysorted[$temp]} -gt ${array[$temp2]} ]]
		then
			x=${arraysorted[$temp]}
			temporary=0
			while [ $temporary -lt $array_length ]
			do
				if [[ ${array[$temporary]} = $x ]]
				then
					break
				fi 
				temporary=`expr $temporary + 1`
			done 
			tempno=${arraysorted[$temp]}
			arraysorted[$temp]=${array[$temp2]}
			array[$temp2]=$tempno
			array[$temporary]=${arraysorted[$temp]}
			#echo -n "${arraysorted[$temp]}"
			echo -n "$tempno"
		break
		fi 
	temp=`expr $temp + 1`
		
	done
	
	l=$j
	tempno=0
	while [ $l -lt $array_length ]
	do	
		l1=`expr $l + 1` 
		while [ $l1 -lt $array_length ]
		do
			if [[ ${array[$l1]} -lt ${array[$l]} ]]
			then
			
				tempno=${array[$l1]}
				array[$l1]=${array[$l]}
				array[$l]=$tempno
		
			fi
		l1=`expr $l1 + 1`
		
		done						
		
		l=`expr $l + 1`
	done
	l=$j
	while [ $l -lt $array_length ]
	do
	
		echo -n "${array[$l]}"
	l=`expr $l + 1`
		
	done
	 	
echo ""

i=`expr $i + 1`

done
