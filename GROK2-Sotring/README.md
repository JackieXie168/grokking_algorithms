# CH 2 – Sorting

## Arrays vs Linked Lists

Arrays are contiguous memory blocks that are granted by the time array is initialised. Operations like inserting items in an array or appending a large amount of elements is not so effective and can cause sluggish behaviour. Put simply, array blocks should always be adjacent. So if an array of 2 elements is going to be appended by 5 elements and there's only one free block, the memory should perform thousands of jigsaw manipulations.

Linked lists in contrast can be stored anywhere in the memory without performance loss, as their instances hold references to the next element in the list, thus allowing for continuity while preserving resources.

Some pooints of differences below:

| Trait                                                        | Swift Array                                                  | Linked List                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **RAM allocation**                                           | Continuous memory blocks                                     | Anywhere in the memory                                       |
| **Insertion time**                                           | Linear (`O(n)`) at minimum                                   | Constant (`O(1)`)                                            |
| **Removing item at,<br />index traversing <br />over collection** | Traversing - linear (`O(n)`);<br />Removing - constant (`O(1)`);<br />Recollecting indices - linear (`O(n)`) as <br />all indices should be decremented till the <br />end of the collection. | Traversing - linear (`O(n)`);<br />Removing - constant (`O(1)`);<br />Rearranging list - constant (`O(1)`). |
| **Binary search**                                            | Easy to implement                                            | Shitload of hell                                             |
| **Ecpensive to cache**                                       | NO                                                           | YES                                                          |
| **Accessing item at index**                                  | Constant time                                                | Linear                                                       |



## Linked Lists

See [Grokking-Algorithms-Study-Notes](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-2-sorting)/[GROK2-Sotring](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-2-sorting/GROK2-Sotring)/[LinkedList.playground](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-2-sorting/GROK2-Sotring/LinkedList.playground)/**Contents.swift** for rough implementation of singly linked list with CRUD suite and reverse option.

Linked list is a linear data structure where all elements (hereinafter referred to as nodes) are arranged sequentially (or linearly). Each node of the list refers to the next node. Both of them are fact is separate objects.

Linked lists can be singly-linked (elements holds reference to the next) and doubly-linked (each node has link to next and link to previous).

Linked lists should not be used when the purpose is to randomly access the elements of the collection.

## Sorting

Actually I obtained more about linked lists in this chapter, so I just completed a class with two sort methods – asc and desc.

See [Grokking-Algorithms-Study-Notes](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-2-sorting)/[GROK2-Sotring](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-2-sorting/GROK2-Sotring)/[Sorting.playground](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-2-sorting/GROK2-Sotring/Sorting.playground)/**Contents.swift**





