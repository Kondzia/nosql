#!/bin/bash
 
echo
if [ "$#" -ne 2 ]
	then
		echo "Aby uruchomić skrypt należy podać po poleceniu nazwe bazy oraz nazwe kolekcji" 
		echo "Np."
		echo "./import_to_mongo.sh test books"
		echo
	elif [ ! -f  top100books.json ] 
	then
		echo "Błąd.Nie wykrywam pliku  top100books.json. Sprawdź czy znajdujesz się w odpowiednim katalogu !"
	else
		echo "Importowanie danych do bazy $1 i kolekcji $2 ..."
		mongoimport --file  top100books.json --db $1 --collection $2
		echo "Ukończono pomyślnie ! "
fi
