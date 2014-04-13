/**
*
* @file  factorial.cfc
* @author Peter Pham
* @description utility to calculate factorial
* @example
*     myvar = new factorial(5);
*
*/

component output="false" {

	public function init(required numeric num){
		return arguments.num LTE 1 ? arguments.num : arguments.num * init(arguments.num-1);
	}
}