function sitestat(ns_l,label)
{
// Argument label bevat titel van document als niet leeg.
// Deze eerst opschonen, alleen letters en cijfers toestaan
    // Dan toevoegen aan teller
    if (window.location.protocol == "https:") {
        ns_l = ns_l.replace("http://", "https://");
    }
	var str="";
	// Karakters die zijn toegestaan
	var oke="._1234567890abcdefghijklmnopqrstuvwxyz"
	var lbl=label.toLowerCase();
	
	
	// Check iedere karakter in lbl. Indien spatie dan vervangen met '_'.
	for (var i = 0; i < lbl.length; i++) {
		if ( lbl.charAt(i) == ' ')
			{ str += '_'; }
		else if ( oke.indexOf(lbl.charAt(i)) >= 0 )
			{ str += lbl.charAt(i); }
	}
    // laatste karakter een punt: verwijderen
   
    if (str.substring(str.length-1,str.length-0) == '.')
	{
	    str=str.substring(0,str.length-1);

	}
	//De punt in een filename vervangen met '_'.
	if (str.substring(str.length-4,str.length-3) == '.')
	{
		str=str.substring(0,str.lastIndexOf(".")) + "_" + str.substring(str.lastIndexOf(".")+1,str.length);
	}

	if (str.length > 0)
	{
		ns_l += str; 
	}
	
	ns_l+="&ns__t="+(new Date()).getTime();
	ns_pixelUrl=ns_l;
	
	ns_0=top.document.referrer;
	// Indien de positie van de laatste keer dat er een '/' gelijk is aan de lengte van ns_0-1 dan alles voor de '/'
	// anders gewoon ns_0. (syntax: substring(from, to))
	ns_0=(ns_0.lastIndexOf("/")==ns_0.length-1)?ns_0.substring(ns_0.lastIndexOf("/"),0):ns_0;
	if(ns_0.length>0)
	{
		// De escape functie codeert een URL waarbij een '/' wordt vervangen door %2F en een spatie door %20
		ns_l+="&ns_referrer="+escape(ns_0);
	}
	document.write ("<img src=\""+ns_l+"\" width=1 height=1 alt=\"\">"); // alt="" toegevoegd voor betere toegankelijkheid
	//alert("<img src=\""+ns_l+"\" width=1 height=1>")
}
