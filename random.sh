#!/bin/bash

generateRandomNumber () {
  for i in {0..3}
  do
    echo -ne '        this is so                              \r'
    sleep .4
    echo -ne '               like                             \r'
    sleep .6
    echo -ne '                        ...                     \r'
    sleep .8
    echo -ne '                                         random \r'
    echo -ne '\n'

    sleep 1
    if [[ $i == 0 ]]
    then
      curl --silent wttr.in/newyork?format="%t" | grep -Eo '[0-9]{1,4}' >> final-seed.txt
    elif [[ $i == 1 ]]; then
      curl --silent wttr.in/omaha?format="%t" | grep -Eo '[0-9]{1,4}' >> final-seed.txt
    elif [[ $i == 2 ]]; then
      curl --silent wttr.in/los+angeles?format="%t" | grep -Eo '[0-9]{1,4}' >> final-seed.txt
    else
      curl --silent wttr.in/san+francisco?format="%t" | grep -Eo '[0-9]{1,4}' >> final-seed.txt
    fi

    date +"%T" | grep -Eo '[0-9]{1,4}' > time.txt
    echo "$1" >> time.txt
    grep -o '[[:digit:]]*' time.txt | paste -sd+ - | bc >> final-seed.txt

  done
}

reseed () {
  grep -o '[[:digit:]]*' final-seed.txt | paste -sd+ - | bc > seed.txt

  grep -Eo '.$' ./seed.txt > ./digits.txt
  sed 's/.\(.\)./\1/' ./seed.txt >> ./digits.txt
  sed 's/\(.\{1\}\).*/\1/' ./seed.txt >> ./digits.txt

  grep -o '[[:digit:]]*' digits.txt | paste -s -d* - | bc > reseed.txt
  rm final-seed.txt
  rm digits.txt
  rm time.txt
  generateRandomNumber `cat reseed.txt`
  rm reseed.txt
}

generateRandomNumber "1"
reseed

grep -o '[[:digit:]]*' final-seed.txt | paste -sd+ - | bc > seed.txt
