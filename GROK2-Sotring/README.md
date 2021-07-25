# CH 2 – Sorting

## Arrays vs Linked Lists

Arrays are contiguous memory blocks that are granted by the time array is initialised. Operations like inserting items in an array or appending a large amount of elements is not so effective and can cause sluggish behaviour. Put simply, array blocks should always be adjacent. So if an array of 2 elements is going to be appended by 5 elements and there's only one free block, the memory should perform thousands of jigsaw manipulations.

Linked lists in contrast can be stored anywhere in the memory without performance loss, as their instances hold references to the next element in the list, thus allowing for continuity while preserving resources.

Some pooints of differences below:

| Trait                                                        | Swift Array                                                  | Linked List                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **RAM allocation**                                           | Continuous memory blocks                                     | Anywhere in the memory                                       |
| **Insertion time**                                           | Linear (`O(n)`) at minimum                                   | Constant (`O(1)`)                                            |
| **`remove(item: at index:)`,<br />traversing over collection** | Traversing - linear (`O(n)`);<br />Removing - constant (`O(1)`);<br />Recollecting indices - linear (`O(n)`) as <br />all indices should be decremented till the end of the collection. | Traversing - linear (`O(n)`);<br />Removing - constant (`O(1)`);<br />Rearranging list - constant (`O(1)`). |
| **Binary search**                                            | Easy to implement                                            | Shitload of hell                                             |
| **Ecpensive to cache**                                       | NO                                                           | YES                                                          |



## Linked Lists

**References:**

- https://www.raywenderlich.com/947-swift-algorithm-club-swift-linked-list-data-structure

Linked list is the linear data structure – the structure where all elements are arranged sequentially (or linearly). Next element is adjacent to previous. Each item in the list is in fact a separate object. But each object is holding a reference to another one. **Thus they're linked by reference field**.

Each item is also referred to as node.

Linked lists can be singly-linked (elements holds reference to the next) and doubly-linked (each node has link to next and link to previous).





