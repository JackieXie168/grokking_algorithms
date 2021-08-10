# CH4 – Quicksort

## Quick Sort Algorithm Imp

This is an algorithm of sorting a heterogeneous population of items asc / desc. The sorting is based on "divide and conquer" principle. Quicksort can be implemented recursively. This means two base cases can be set in:

- the array to sort is empty
- the array to sort contains the sole item

For the rest, the algorithm should enter recursion.

Quick sort algorithm works through the pivot element. Two arrays, one with elements greater than pivot, second with elements lesser than pivot are created from input. These arrays are not sorted, they're just extracted from the input.

In the return statement the function it calls itself until the base case is reached. The concatenated result of all calls is then returned. The effectiveness of this algorithm is highly relies on how precisely the pivot element is selected.
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

## Quick Vs Merge Sort – Constants

It is known that constants do not play anything in time complexity assessment, they're just threwn away. But in case when quick sort is compared to merge sort, it becomes importnant to take in account.

Merge sort has `O(n logn)` complexity in the worst case (as it doubles the population in order to reach the most granular state of input elements)
Quick sort goes `O(n)` in the worst case, which is slower. But in average, quick sort does the same `O(n logn)`.

So we go `O(n logn)` vs. `O(n logn)`, assuming quick sort hits the average case. But the constant of the merge sort is higher. So the merge sort can take much more time.

## Quick Sort – Pivot Element

As said earlier the effectiveness of quick sort algorithms highly relies on how precisely the pivot element is selected.

Consider first element is taken as pivot and passed in to quickSort func in a **sorted** array of 8 elements. It'll turn out that there will be 3 elements:

- lesser sub-array (will be empty)
- pivot element (`sequence[0] = 1`)
- bigger sub-array (all other elements, excl. `1`)

It is clear that lesser sub-array is already in it's base case and will not be exposed, so we're interested in the bigger sub-array. Each time, the pivot element is selected, until we reach the base case, where the sole element (`8`) is left. It'll take times equal `array.count` to reach the base case. So the complexity here will be `O(n2)`.

Now consider the same situation, but with pivot element selected from the middle. The call stack will have 4 calls (you can count it yourself). And this will hit `O(logn)`. **BUT** in order to separate the array into three parts the control flow should **iterate** over the array. And in each call there will be such iteration. We already know that iteration takes `time == arrayToIterate.count`. So completing each call will take `O(n)`.
But the stack 'height' will be `O(logn)`. Therefore the final formula for the algorithm will be something like: `number of iterations in each call * number of calls` and that is `O(n) * O(n logn) = O(n logn)`. 

The worst case takes `O(n)` levels with `O(n)` iterations: `O(n) * O(n) = O(n^2)`.
