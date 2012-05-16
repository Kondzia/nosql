#!/bin/bash
clear

function help() {
	echo "/--------------- HELP ---------------------------------"
	echo "Aby uruchomić skrypt należy podać po poleceniu nazwe bazy oraz nazwe kolekcji" 
	echo "Np."
	echo "./import_mongo_to_couch.sh http://localhost:5984 test books"
	echo "------------------------------------------------------/"
  exit 1
}

#$1- host
#$2- nazwa_bazy
#$3- nazwa_kolecji

if [ $# -ne 3 ]; then
	help
else

		echo "Exportowanie danych z bazy" $1 "z kolekcji" $2
		mongoexport --db $2 --collection $3 --out mongoData1.json
		
		echo "Przygotoywanie danych"
		cat mongoData1.json | sed -e 's/"_id[^\}]*\},//g' > mongoData2.json

		echo "Importowanie danych do Couchdb:" $1"/"$2
		./import_to_couch.sh $1 $2 mongoData2.json
		echo "Ukończone pomyślnie !"
		rm mongoData1.json
		rm mongoData2.json
fi
