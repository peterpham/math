/**
*
* @file  prime.cfc
* @author Peter Pham
* @description utility to deal with prime number
* @example
*     
*
*/

component output="false" {

	
	/**
	* @description determine if a number is prime
	* @param numeric number 
	* @return boolean
	**/
	public function isPrime(required numeric n){
		// for number less than 10
		if (n LTE 10) {
			if (ListFind("2,3,5,7", n)) {
				return true;
			} else {
				return false;
			}
		}
		else if (n mod 2 eq 0) {
			return false;
		}
		else {
			var sqrOfN = sqr(n);
			for (var i = 3; i lte sqrOfN; i+=2) {
				if (n mod i eq 0) {
					return false;
				}
			}
		}

		return true;
	}

	/**
	* @description find all prime numbers less than or equal a given integer using Sieve of Eratosthenes method
	* @param numeric n number
	* @return array
	**/
	public function findPrimeNumberLessThanOrEqual(required numeric n) {
		var ar = [];
		var num = 0;

		// create an array from 2 to n
		for(var i=2; i LTE n; i++) {
			arrayAppend(ar,i);
		}
		
		// loop through array and eliminate number that multiplies to original number
		for(var j=1; (ar[j] ^ 2) LTE n ; j++) {
			num = ar[j];

			ar = arrayFilter(ar, function(value, index, ar){
					return (value eq num) OR (value mod num neq 0);
				});
		}
		return ar;
	}

	/**
	* @description find prime factor 
	* @see http://people.revoledu.com/kardi/tutorial/BasicMath/Prime/Algorithm-PrimeFactor.html
	* @param numeric n number
	* @return array
	**/
	public function findPrimeFactor(required numeric n) {
		var result = [];
		var p = 2; // prime number to test with

		while (n GTE (p^2)) {
			// number is divided by the prime number, we continue divide it
			if (n mod p eq 0) {
				arrayAppend(result,p);
				n /= p;
			} else {
			// otherwise increase the prime number (from 2, then 3, 5, 7, 9, etc.)
				p += (p eq 2 ? 1 : 2);
			}
		}
		// add the remaining of the number
		arrayAppend(result, n);
		return result;
	}
}