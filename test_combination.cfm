<cfscript>

test_items = [1, 2, 3];
NUM_TEST_CASES = 10;
K_ITEMS = 3;
for (i = K_ITEMS+1; i <= NUM_TEST_CASES; i++) {

    // create test case
    test_items.append(i);

    for (j = K_ITEMS; j LTE i; j++) {
	    result = new lib.combination(test_items, j);
    	// test to make sure that the number of items in combination is correct
	    expect = i === j ? 1 : (new lib.factorial(i)) / ((new lib.factorial(j)) * (new lib.factorial(i-j)));
	    WriteOutput("Combination of #j# in #i# items is #result.len()#. ");
	    WriteOutput((expect eq result.len() ? "PASS" : "FAIL") & "<br />");
    }
}

</cfscript>
