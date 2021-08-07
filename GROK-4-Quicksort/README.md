# CH4 – Quicksort

## QuickSort Algorithm Imp

This is an algorithm of sorting a heterogeneous population of items asc / desc. The sorting is based on "divide and conquer" principle. Quicksort can be implemented recursively. This means two base cases can be set in:

- the array to sort is empty
- the array to sort contains the sole item

For the rest, the algorithm should enter recursion.

Quick sort algorithm works through the pivot element. Two arrays, one with elements greater than pivot, second with elements lesser than pivot are created from input. These arrays are not sorted, they're just extracted from the input.

In the return statement the function it calls itself until the base case is reached. The concatenated result of all calls is then returned. The effectiveness of this algorithms highly relies on how precisely the pivot element is selected.
In worst case the complexity of the algorithm will be `O(n * logn)`.

```markdown
### Sample representation of hypothetic recursive return of quick sort
qSort([2,1]) + [3] + qSort([5,4])
|
|
V
[ [1] + [2] + [3] + [4] + [5] ]
```

For some work on quickSort algorithm see: [Grokking-Algorithms-Study-Notes](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-4-quicksort)/[GROK-4-Quicksort](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-4-quicksort/GROK-4-Quicksort)/[Quicksort.playground](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-4-quicksort/GROK-4-Quicksort/Quicksort.playground)/**Contents.swift**

