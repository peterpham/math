/**
*
* @file  permutation.cfc
* @author Peter Pham
* @description utility to calculate a permutation
* @example
*     myvar = new permutation(['a', 'b', 'c']);
*
*/

component output="false" {

	public function init(required array list) {
		
		var permutation = function (required array list) {

			if (arguments.list.len() lt 2) {
				return [arguments.list];
			}

			// take the first item out the list
			var first = arguments.list.first();
			// get the rest of the list
			var rest = arguments.list.slice(2);
			// create a permutation of the list
			var sets = permutation(rest);
			var newsets = [];
			// for each permutated set, append the first character to all possible position
			sets.each(function(set){
				var len = set.len();
				var newset = [];
				for (var i=1; i LTE (len+1); i++) {
					newset = duplicate(set);
					newset.insertAt(i, first);
					newsets.append(newset);
				}
			});

			return newsets;

		}
		return permutation(arguments.list);
	}
}