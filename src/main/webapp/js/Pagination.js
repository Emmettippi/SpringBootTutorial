function pagination(calledPage){
	var string="<ul class='pagination pagination-lg'>";
	switch(page){
	case 1:
		string+="<li><a href='#'>Home</a></li>" +
				"<li><a href='form_insert_city?id=0'>Inserisci una nuova città</a></li>";
		break;
	case 2:
		string+="<li><a href='home'>Home</a></li>" +
				"<li><a href='#'>Inserisci una nuova città</a></li>";
		break;
	}
	string+="</ul>";
	return string;
}