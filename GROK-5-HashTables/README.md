# CH5 – Hash Tables

## Additional References

- [Swift Algorithm Club: Hash Tables](https://www.raywenderlich.com/206-swift-algorithm-club-hash-tables)
- [L33tCode - HashTable](https://leetcode.com/explore/learn/card/hash-table)

## What is a Hash Table

Hash tables are data structures that provide users with quick insertion and search of items, achieved by hashing data via `hash functions`. These functions generate `hash value` that is used to retrieve or map data to the collection.

> Lookup, insetion and deletion takes constant time O(1) 

Generally two hash table subtypes are distinguished: `hash set` and `hash map`.

- `hash set` - unordered unique items of a single type (`Set<Element: Hashable>`)
- `hash map` - unordered, key-value pairs, unique keys (`Dictionary<Key: Hashable, Value>`)

## Hash Tables Internals: Hash Functions

In context of hash tables `hash functions` compute hash index of elements as `i = hash(key)`. Hash-table effectiveness relies on how effectively `hash function` can produce the distribution of values *[may need to be clarified - maths]*:

- mapping should get the same result each time, e.g. `hash("apple") -> 4` should always return `4` with this input.
- mapping should not return same number for different inputs.

It's fair to state that hash functions can produce enormous hashes, that furthermore can be negative. A common way to neat this up is to make modulo opertaion on absolute hash value, using the size of the collection: `abs(hash) % array.count`.
This shorthand implies mathematical limitation - hash function is can produce a collision.

## Hash Tables Internals: Collisions

Collision is a case when hash function maps two different keys to one bucket.

```swift
// MARK: - Simulating Collision

getIndex(from: djb2Hash("cat" ), 5) -> 0
getIndex(from: djb2Hash("cats"), 5) -> 0
```

Chaining is the common way to overcome collisioning problems when designing a hash table. When the table engages this technique, each array element acts as a "bucket" with a list of zero to infinity key-value pairs. Linked list can perfectly manage this thing.

Consider the example below:

```ceylon
[1]: no items
[2]: no items
[3]: ––> ["firstName": "Steve"] ––> ["lastName": "Jobs"]
```

When `hashTable["lastName"]` is called, the key is hashed and the index (`3`) sets in. But here's the catch – 3rd bucket has two linked items. So the second round will be to step through the list and match the corresponding key. After "lastName" was matched, "Jobs" is returned.

## Hash Sets



## Applying Hash Tables

## Hash Tables Internals: Implementation

Swift dictionary is itself a hash-table.

## Analysing Effectiveness

---

## Recap Bullets

- `hash function` and a `(bucket)array` are the main components of a hash-table;
- 

