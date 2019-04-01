#!/bin/bash
cd
sleep .5
echo " "
echo "                     getting in touch with file spirits..."
echo " "

find . -iname "*.pdf" -print 2>&1 | grep -v "Permission denied" | sed -e 's/^/./' > ./computospirit/one.txt

echo " "
echo "                     talking to your folders..."
echo " "
cd computospirit

sed -e 's;[\.\/@_~-]; ;g;' ./one.txt > ./two.txt
shuf ./two.txt --output=./two.txt
cat ./two.txt | tr ' ' '\n' > ./three.txt
shuf ./three.txt --output=./three.txt
cat ./three.txt | tr '\n' ' ' > ./four.txt
sed -e 's;pdf; ;g;' ./four.txt > ./message.txt
sleep 2

echo " "
echo "                                they have a message for you..."
echo " "
sleep 1

while IFS= read -r -n1 char; do
	echo -n "$char"
  sleep .1;
done < ./message.txt
