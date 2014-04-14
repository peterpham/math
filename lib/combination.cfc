/**
*
* @file  combination.cfc
* @author Peter Pham
* @description utility to calculate combination
* @example
*     myvar = new combination(['1', '2', '3'], 2);
*
*/

component output="false" {

	public function init(required array list, required numeric k){
		
		var combination = function (required array list, required numeric k, numeric startIndex = 1, array set = [], array sets = []) {
			if (arguments.set.len() EQ arguments.k) {
				// the current combination set contains k items, add this set to the result
				arguments.sets.append(duplicate(arguments.set));
				return arguments.sets;
			}

			var len = list.len();
			// loop through each item at the start index
			for (var i = arguments.startIndex; i LTE len; i++) {
				// push the item into the set
				arguments.set.append(arguments.list[i]);
				// recursive call to make combination for the item at the next index
				combination(arguments.list, arguments.k, ++arguments.startIndex, arguments.set, arguments.sets);
				// pop out the last item in the set
				arguments.set.deleteAt(arguments.set.len());
			}

			return arguments.sets;
		}

		return combination(arguments.list, arguments.k);
	}

	public function howMany(required numeric n, required numeric k) {
		
		return (new factorial(n)) / ((new factorial(k)) * (new factorial(n-k)));

	}
}