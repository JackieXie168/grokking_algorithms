# CH 2 – Sorting

## Arrays vs Linked Lists

Arrays are contiguous memory blocks that are granted by the time array is initialised. Operations like inserting items in an array or appending a large amount of elements is not so effective and can cause sluggish behaviour. Put simply, array blocks should always be adjacent. So if an array of 2 elements is going to be appended by 5 elements and there's only one free block, the memory should perform thousands of jigsaw manipulations.

Linked lists in contrast can be stored anywhere in the memory without performance loss, as their instances hold references to the next element in the list, thus allowing for continuity while preserving resources.