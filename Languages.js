
m = function() {
		if(this.Language_Original == "Polski")
			emit("Polski",1);
		
		else
			emit("Obcojezyczna",1);
};



r = function(key, values) {
	var result = 0;
	values.forEach(function(count) {
		result += count;
	});
	return result;
};	 

res = db.book.mapReduce(m, r, {out: "language"});
printjson(res);
