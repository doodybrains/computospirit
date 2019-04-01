#!/bin/bash
cd
sleep .5
echo " "
echo "      🌪   🌪   🌪   🌪   getting in touch with file spirits 🌪  🌪  🌪  🌪"
echo " "
sleep .5
find . -iname "*.pdf" -print 2>&1 | grep -v "Permission denied" | sed -e 's/^/./' > ./computospirit/one.txt &
PROGRESS=$!
while kill -0 $PROGRESS 2> /dev/null
do
	echo -n " 🔮 "
  sleep 1
done

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
cat ./three.txt | tr '\n' ' ' > ./four.txt
sed -e 's;pdf; ;g;' ./four.txt > ./message.txt
sleep 3
echo " "
echo "   📎 🦷 🧪 they have a message for you 🧲 🦙 🥬"
echo " "
sleep 1

while IFS= read -r -n1 char; do
	echo -n "$char"
  sleep .1;
done < ./message.txt
