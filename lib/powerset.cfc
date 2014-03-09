/**
*
* @file  powerset.cfc
* @author Peter Pham
* @description utility to calculate a powerset
* @example
*     myvar = new powerset(['a', 'b', 'c']);
*
*/

component output="false" {

    public function init(required array list){

        var powerset = function(required array list, array set=[], array sets=[]){
            if (arguments.list.len()) {
            // input is not empty
                // remove the first item from the list - we need to duplicate the list to avoid modifying original input
                (var newlist = duplicate(arguments.list)).deleteAt(1);
                // create a new set with the first item from the orginal list
                var newset = duplicate(arguments.set).append(arguments.list.first());
                // recursive to get powerset for the current list and the subset-with-the-current-item
                powerset(newlist, newset, arguments.sets);
                // recusrive to get powerset for the current list and the subset-without-the-current-item
                powerset(newlist, arguments.set, arguments.sets);
            } else {
                arguments.sets.prepend(arguments.set);
            }
            return arguments.sets;
        }

        return powerset(arguments.list);
    }
}
