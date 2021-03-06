<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<SCRIPT LANGUAGE="JavaScript">
// By Mattias Sjogren (masj4037@student.uu.se) 
// Courtesy of SimplytheBest.net - http://simplythebest.net/scripts/

var africaArray =  new Array("('Select country','',true,true)",
"('Algeria')",
"('Angola')",
"('Burundi')",
"('Cameroon')",
"('Congo')",
"('Eritrea')",
"('Ethiopia')",
"('Gambia')",
"('Ghana')",
"('Guinea')",
"('Kenya')",
"('Libya')",
"('Madagascar')",
"('Morocco')",
"('Mozambique')",
"('Namibia')",
"('Nigeria')",
"('Rwanda')",
"('Senegal')",
"('Sierra Leone')",
"('Somalia')",
"('South Africa')",
"('Sudan')",
"('Tanzania')",
"('Tunisia')",
"('Uganda')",
"('Zaire')",
"('Zambia')",
"('Zimbabwe')",
"('Other')");

var middleeastArray =  new Array("('Select country','',true,true)",
"('Egypt')",
"('Iran')",
"('Iraq')",
"('Israel')",
"('Jordan')",
"('Kuwait')",
"('Lebanon')",
"('Oman')",
"('Saudi Arabia')",
"('Syria')",
"('Turkey')",
"('U. A. Emirates')",
"('Other')");

var asiaArray =  new Array("('Select country','',true,true)",
"('Armenia')",
"('Bangladesh')",
"('Cambodia')",
"('China')",
"('India')",
"('Indonesia')",
"('Japan')",
"('Malaysia')",
"('Myanmar')",
"('Nepal')",
"('Pakistan')",
"('Philippines')",
"('Singapore')",
"('South Korea')",
"('Sri Lanka')",
"('Taiwan')",
"('Thailand')",
"('Uzbekistan')",
"('Vietnam')",
"('Other')");

var europeArray =  new Array("('Select country','',true,true)",
"('Albania')",
"('Austria')",
"('Belarus')",
"('Belgium')",
"('Bosnia')",
"('Bulgaria')",
"('Croatia')",
"('Cyprus')",
"('Czech Rep.')",
"('Denmark')",
"('Estonia')",
"('Finland')",
"('France')",
"('Germany')",
"('Greece')",
"('Hungary')",
"('Iceland')",
"('Ireland')",
"('Italy')",
"('Latvia')",
"('Liechtenstein')",
"('Lithuania')",
"('Luxembourg')",
"('Macedonia')",
"('Malta')",
"('Monaco')",
"('Netherlands')",
"('Norway')",
"('Poland')",
"('Portugal')",
"('Romania')",
"('Russia')",
"('Slovakia')",
"('Slovenia')",
"('Spain')",
"('Sweden')",
"('Switzerland')",
"('Ukraine')",
"('United Kingdom')",
"('Other')");

var australiaArray =  new Array("('Select country','',true,true)",
"('Australia')",
"('New Zealand')",
"('Other')");

var lamericaArray =  new Array("('Select country','',true,true)",
"('Costa Rica')",
"('Cuba')",
"('El Salvador')",
"('Guatemala')",
"('Haiti')",
"('Jamaica')",
"('Mexico')",
"('Panama')",
"('Other')");

var namericaArray =  new Array("('Select country','',true,true)",
"('Canada')",
"('USA')",
"('Other')");

var samericaArray =  new Array("('Select country','',true,true)",
"('Argentina')",
"('Bolivia')",
"('Brazil')",
"('Chile')",
"('Colombia')",
"('Ecuador')",
"('Paraguay')",
"('Peru')",
"('Suriname')",
"('Uruguay')",
"('Venezuela')",
"('Other')");

function populateCountry(inForm,selected) {
	var selectedArray = eval(selected + "Array");
	while (selectedArray.length < inForm.country.options.length) {
		inForm.country.options[(inForm.country.options.length - 1)] = null;
	}	
	for (var i=0; i < selectedArray.length; i++) {
		eval("inForm.country.options[i]=" + "new Option" + selectedArray[i]);
	}
	if (inForm.region.options[0].value == '') {
		inForm.region.options[0]= null;
		if ( navigator.appName == 'Netscape') {
			if (parseInt(navigator.appVersion) < 4) {
				window.history.go(0);
			}
	else {   	
		if (navigator.platform == 'Win64' || navigator.platform == 'Win32') {
			window.history.go(0);
            }
         }
      }
   }
}

function populateUSstate(inForm,selected) {  
var stateArray =  new Array("('Select state','',true,true)",
"('Alabama')",
"('Alaska')",
"('Arizona')",
"('Arkansas')",
"('California')",
"('Colorado')",
"('Connecticut')",
"('Delaware')",
"('Columbia')",
"('Florida')",
"('Georgia')",
"('Hawaii')",
"('Idaho')",
"('Illinois')",
"('Indiana')",
"('Iowa')",
"('Kansas')",
"('Kentucky')",
"('Louisiana')",
"('Maine')",
"('Maryland')",
"('Massachusetts')",
"('Michigan')",
"('Minnesota')",
"('Mississippi')",
"('Missouri')",
"('Montana')",
"('Nebraska')",
"('Nevada')",
"('New Hampshire')",
"('New Jersey')",
"('New Mexico')",
"('New York')",
"('North Carolina')",
"('North Dakota')",
"('Ohio')",
"('Oklahoma')",
"('Oregon')",
"('Pennsylvania')",
"('Rhode Island')",
"('South Carolina')",
"('South Dakota')",
"('Tennessee')",
"('Texas')",
"('Utah')",
"('Vermont')",
"('Virginia')",
"('Washington')",
"('West Virginia')",
"('Wisconsin')",
"('Wyoming')");

	if (selected == 'USA') {
		for (var i=0; i < stateArray.length; i++) {
			eval("inForm.country.options[i]=" + "new Option" + stateArray[i]);
		}
		if ( navigator.appName == 'Netscape') {
			if (parseInt(navigator.appVersion) < 4) {
				window.history.go(0)
			}
			else {    	
				if (navigator.platform == 'Win32' || navigator.platform == 'Win16') {
					window.history.go(0)
		        }
		    }
	   }
	}
	else {
		
	}  
	if (selected == 'Other') {
		newCountry = "";
		while (newCountry == ""){
			newCountry=prompt ("Please enter the name of the country.", "");
		}
		if (newCountry != null) {
			inForm.country.options[(inForm.country.options.length-1)]=new Option(newCountry,newCountry,true,true);
			inForm.country.options[inForm.country.options.length]=new Option('Other, not listed','Other');
	    }
	}
	if(inForm.country.options[0].text == 'Select country') {
		inForm.country.options[0]= null;
	   }
	}
</script>
</HEAD>

<BODY>
<form name="world">
<select name="region" onChange="populateCountry(document.world,document.world.region.options[document.world.region.selectedIndex].value)">
<option selected value=''>Select Region</option>
<option value='asia'>Asia</option>
<option value='africa'>Africa</option>
<option value='australia'>Australia</option>
<option value='europe'>Europe</option>
<option value='middleeast'>Middle East</option>
<option value='lamerica'>Latin America</option>
<option value='namerica'>North America</option>
<option value='samerica'>South America</option>
</select>
<select name="country" onChange="populateUSstate(document.world,document.world.country.options[document.world.country.selectedIndex].text)">
<option value=''>--------------------</option>
</select>
</form>
</BODY>
</HTML>