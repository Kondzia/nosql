#!/bin/bash
clear

echo
if [ "$#" -ne 4 ]
  then
	echo "Aby uruchomić skrypt należy podać po poleceniu nazwe bazy oraz nazwe kolekcji z mongo a nastepnie nazwe indexy i typu do elastic"
	echo "Np."
	echo "./import_mongo_to_elastic.sh test books test books"
	echo
  else
	echo "Exportowanie danych z bazy $1 z kolekcji $2 ..."
	mongoexport --db $1 --collection $2 --out .tmp.json
	echo "Zapisywanie danych do bazy Elasticsearch."
	I=0
	while read; do
		I=$(($I + 1))
		curl -XPUT http://localhost:9200/$3/$4/$I -d "$REPLY"
	done < "top100books.json"
	echo "Ukończono pomyślnie !"
	rm .tmp.json
fi
