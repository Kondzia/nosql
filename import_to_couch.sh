#!/bin/bash
clear

function help() {
	echo "/--------------- HELP ---------------------------------"
	echo "Aby uruchomić skrypt należy podać po poleceniu nazwe bazy oraz nazwe kolekcji" 
	echo "Np."
	echo "./import_to_couch.sh http://localhost:5984 books"
	echo "------------------------------------------------------/"
  exit 1
}

#$1-host
#$2-nazwa_bazy

if [ $# -ne 2 ]; then
help
	elif [ ! -f  top100books.json ] 
	then
		echo "Błąd.Nie wykrywam pliku  top100books.json. Sprawdź czy znajdujesz się w odpowiednim katalogu !"
		
	else

echo "Deleting the database: " $1"/"$2

	curl -X DELETE  $1"/"$2


echo "Creating new database: "$1"/"$2
	curl -X PUT  $1"/"$2

	while read line 
	do
		curl -d "$line" -X POST -H "Content-Type: application/json" $1"/"$2 
	done < "top100books.json";
	echo "Ukończono pomyślnie ! "

fi

exit 0
