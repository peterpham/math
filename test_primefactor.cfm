<cfscript>
	util = new lib.prime();
	
	ar1 = util.findPrimeNumberLessThanOrEqual(500);
	dump(var="#ar1#", label = "findPrimeNumberLessThanOrEqual");	

	ar2 = util.findPrimeFactor(500);
	dump(var="#ar2#", label = "findPrimeFactor");
</cfscript>