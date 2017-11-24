function newCity(){
	var city={id:"",
			name:"",
			country:newCountry(),
			population:"",
			district:""};
	return city;
}

function newCountry(){
	var country={code:"",
			name:"",
			continent:"",
		};
	return country;
}