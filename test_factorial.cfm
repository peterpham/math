<cfscript>

NUM_TEST_CASES = 10;

test_items = [];
for (i = 1; i <= NUM_TEST_CASES; i++) {

    result = new lib.factorial(i);
    WriteOutput("#i#! = #result# <br /> ");
}

</cfscript>