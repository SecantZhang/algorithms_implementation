/**
 * Swap function for swap the array elements with the first index and second index. 
 * @param {*} array 
 * @param {*} firstIndex 
 * @param {*} secondIndex 
 */
var swap = function(array, firstIndex, secondIndex) {
    var temp = array[firstIndex];
    array[firstIndex] = array[secondIndex];
    array[secondIndex] = temp;
};

/**
 * Function for finding the minimum value index. 
 * @param {*} array 
 * @param {*} startIndex 
 */
var indexOfMinimum = function(array, startIndex) {

    var minValue = array[startIndex];
    var minIndex = startIndex;

    for(var i = minIndex + 1; i < array.length; i++) {
        if(array[i] < minValue) {
            minIndex = i;
            minValue = array[i];
        }
    } 
    return minIndex;
}; 

/**
 * Selection Sort Algorithm Implementation. 
 */
var selectionSort = function(array) {
    var minIndex;
    for (var i = 0; i < array.length - 1; i++) {
        minIndex = indexOfMinimum(array, i);
        swap(array, i, minIndex);
    }
};

/**
 * Examples using selection sort. 
 */

var array = [22, 11, 99, 88, 9, 7, 42];
selectionSort(array);
println("Array after sorting:  " + array);
Program.assertEqual(array, [7, 9, 11, 22, 42, 88, 99]);

var array2 = [-88, -99, -77, -93, -101, -144];
selectionSort(array2);
println("Array2 after sorting: " + array2);
Program.assertEqual(array2, [-144, -101, -99, -93, -88, -77]);

