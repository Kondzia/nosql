Repozytorium na zaliczenie zajęć z Technologii NoSQL.
Zawiera plik top100books.json w którym zapisane jest 100 rekordów odnośnie listy top 100 książek.


1. Import z pliku JSON do mongo:
Skrypt:			import_to_mongo.sh
Użycie:			./import_to_mongo.sh test books
Sprawdzenie:	db.books.find()

2. Import z mongo do couch:
Skrypt:			import_mongo_to_couch.sh
Użycie:			./import_mongo_to_couch.sh http://localhost:5984 test books
Sprawdzenie: 	http://localhost:5984/_utils/database.html?test
				(lub wejść na http://localhost:5984/_utils i wybrać baze z listy)

3. Import z mongo do elasticsearch:
Skrypt:			import_mongo_to_elactic.sh
Użycie:			./import_mongo_to_elastic.sh test books test books
Sprawdzenie:	http://localhost:9200/test/ksiazki/1
				(Pokaże 1 rekord z bazy, aby zobaczyć kolejne należy zmienić cyfrę na końcu)

4.Import z pliku JSON do couch:
Skrypt:			import_to_couch.sh
Użycie:			./import_to_couch.sh http://localhost://5984 books top100books.json
Sprawdzenie: 	http://localhost:5984/_utils/database.html?books
				(lub wejść na http://localhost:5984/_utils i wybrać baze z listy)

5.Map Reduce dla Mongo:
Map Reduce zlicza ile w bazie jest książek Polskich, a ile obcojęzycznych.
Plik: 			Languages.js
Użycie:			mongo Languages.js --shell
				db.language.find()
