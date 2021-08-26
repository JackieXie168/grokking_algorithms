# CH5 – Hash Tables

### Additional References

- [Swift Algorithm Club: Hash Tables](https://www.raywenderlich.com/206-swift-algorithm-club-hash-tables)
- [L33tCode - HashTable](https://leetcode.com/explore/learn/card/hash-table)

### What is a Hash Table

Hash tables are data structures to provide users with quick insertion and search of items. These tables use hash functions under the hood.

### Hash Tables Internals: Hash Functions

Hash function in general maps the data of arbitrary size (or type) to a fixed-size values.  For instance it can be a function that accepts a string and returns an integer. 
Sample declaration: `hashFunc(key: String) -> Int`.

I play with hash functions [here](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/blob/GROK-5-hash-tables/GROK-5-HashTables/HashTables.playground/Contents.swift). 
⚠️ - link may will need to be updated in future.

Hash functions design should follow some rules:

- mapping should get the same result each time, e.g. `hashFunc("apple") -> 4` should always return 4 with this input.
- mapping should not return same number for different inputs.

It's fair to state that hash functions can produce enormous hashes, that can be negative. A common way to neat this up is to make modulo opertaion on absolute hash value, using the size of the array: `abs(hash) % array.count`.

But here is one problem – collisions can be:

```swift
// MARK: - Simulating Collision

getIndex(from: djb2Hash("cat" ), 5) -> 0
getIndex(from: djb2Hash("cats"), 5) -> 0
```

### Hash Tables Internals: Collisions

Collision is generally a case when hash function maps two different keys to one bucket.

Chaining is the common way to overcome collisioning problems when designing a hash table. When the table is on this technique, each array element acts a role of a bucket with a list of zero to infinity key-value pairs.

Consider the example below:

```ceylon
[1]: no items
[2]: no items
[3]: ––> ["firstName": "Steve"] ––> ["lastName": "Jobs"]
```

When `hashTable["lastName"]` is called, firstly hashing capabilities of the table engage and calculate the index of the content. But here's the catch – 3rd bucket has two linked items. So the second round will be to step through the list and match the corresponding key. After "lastName" was matched, "Jobs" is returned.

### Applying Hash Tables

### Hash Tables Internals: Implementation

Swift dictionary is itself a hash-table.

### Analysing Effectiveness

