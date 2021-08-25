# CH5 – Hash Tables

### Additional References

- [Swift Algorithm Club: Hash Tables](https://www.raywenderlich.com/206-swift-algorithm-club-hash-tables)

### What is a Hash Table

Hash tables are arrays. When a value is inserted into the hash table (usually made by key), the table uses this key to calculate element index . Adding a value of a different key puts it to the different index. Under the hood when the user introduces a new key, the hash table asks for key's hash value.

### Hash Tables Internals: Hash Functions

Hash function in general maps the data of arbitrary size (or type) to a fixed-size values.  For instance it can be a function that accepts a string and returns an integer. 
Sample declaration: `hashFunc(key: String) -> Int`.

I play with hash functions [here](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/blob/GROK-5-hash-tables/GROK-5-HashTables/HashTables.playground/Contents.swift). 
⚠️ - link may will need to be updated in future.

Hash functions design should follow some rules:

- mapping itself should get the same result each time, e.g. `hashFunc("apple") -> 4` should always return 4 with this input.
- mapping should not return same number for different inputs.

It's fair to state that hash functions can produce enormous hashes, that can be negative. A common way to neat this up is to make modulo opertaion on absolute hash value, using the size of the array: `abs(hash) % array.count`.

But here is one problem – collisions can be:

```swift
// MARK: - Simulating Collision

getIndex(from: djb2Hash("cat" ), 5) -> 0
getIndex(from: djb2Hash("cats"), 5) -> 0
```

### Hash Tables Internals: Collisions

Chaining is the common way to overcome collisioning problems when designing a hash table. When the table is on this technique, each array element acts a role of a bucket with a list of zero to infinity key-value pairs.

Consider the example below:

```ceylon
[1]: no items
[2]: no items
[3]: ––> ["firstName": "Steve"] ––> ["lastName": "Jobs"]
```

When `hashTable["lastName"]` is called, firstly hashing capabilities of the table engage and calculate the index of the content. But here's the catch – 3rd bucket has two linked items. So the second round will be to step through the list and match the corresponding key. After "lastName" was matched, "Jons" is returned.



### Applying Hash Tables

### Hash Tables Internals: Implementation

Swift dictionary is itself a hash-table.

### Analysing Effectiveness

