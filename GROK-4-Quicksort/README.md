# CH4 – Quicksort

## QuickSort Algorithm Imp

There will be already two base cases:

- the array to sort is empty
- the array to sort contains the sole item

Quick sort algorithm works through the pivot element. Two arrays, one with elements greater than pivot, second with elements lesser than pivot are created from the initial sequence. These arrays are not sorted, they're just extracted from the input.

In the return statement of the function it calls itself until the base case will be reached. The concatenated result of all calls is then returned. The effectiveness of this algorithms highly relies on how precisely the pivot element is selected.
In the worst case the complexity of the algorithm will be `O(n * logn)`.

