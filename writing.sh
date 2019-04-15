#!/bin/bash
lineNoMax=" "
sed 's/.\(.\)./\1/' ./seed.txt > ./lineno.txt
lineNo=`cat lineno.txt`

if [[ $lineNo -gt 100 ]]
then
	lineNoMax+=`expr $lineNo \* 2`
else
	lineNoMax+=`expr $lineNo \* 3`
fi


filename='three.txt'
n=1
mess=""

cd
sleep .5
echo " "
echo "          🌪   🌪   🌪   🌪   getting in touch with file spirits 🌪  🌪  🌪  🌪"
echo " "
sleep .5
find . -iname "*.pdf" -print 2>&1 | grep -v "Permission denied" | sed -e 's/^/./' > ./computospirit/one.txt &
PROGRESS=$!
while kill -0 $PROGRESS 2> /dev/null
do
	echo -n "$lineNoMax 🔮"
  sleep .2
done

echo " "
echo " "
echo " "
echo " "
echo "                 🗂   🗂   🗂   talking to your folders...    🗂   🗂   🗂"
echo " "
echo " "
cd computospirit

sed -e 's;[\.\/@_~-]; ;g;' ./one.txt > ./two.txt
shuf ./two.txt --output=./two.txt
cat ./two.txt | tr ' ' '\n' > ./three.txt
shuf ./three.txt --output=./three.txt
# cat ./three.txt | tr '\n' ' ' > ./four.txt
# sed -e 's;pdf; ;g;' ./four.txt > ./message.txt
sleep 1
echo " "
echo "   📎 🦷 🧪  they have a message for you  🧲 🦙 🥬 "
echo " "
echo " "
echo " "
echo " "

sleep 1

while read line; do
	n=$((n+1))

	if [[ $n -gt $lineNo && (lineNoMax -gt $n)]]
	then
		mess+=" ${line}"
	fi
done < $filename

echo " "
`echo $mess > random-message.txt`
echo " "
echo " "
echo " "

while IFS= read -r -n1 char; do
	echo -n "$char"
  sleep .1;
done < ./random-message.txt

echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
