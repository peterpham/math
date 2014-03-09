<cfscript>

NUM_TEST_CASES = 10;

test_items = [];
for (i = 1; i <= NUM_TEST_CASES; i++) {

    // create test case
    test_items.append(i);
    result = new lib.powerset(test_items);
    // test to make sure that the number of items in powerset is correct
    expect = 2 ^ i;
    WriteOutput("Test #i#: number of items is #result.len()#. ");
    WriteOutput((expect eq result.len() ? "PASS" : "FAIL") & "<br />");
}

</cfscript>
