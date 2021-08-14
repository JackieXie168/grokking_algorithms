# CH5 – Hash Tables

### Applying Hash Tables

### Hash Tables Internals: Implementation

### Hash Tables Internals: Collisions

### Hash Tables Internals: Hash Functions

Hash function in general maps the data of arbitrary size (or type) to a fixed-size values.  For instance it can be a function that accepts a string and returns an integer. 
Sample declaration: `hashFunc(key: String) -> Int`.

Hash functions design should follow some rules:

- mapping itself should get the same result each time. E.g. `hashFunc("apple") -> 4` should always return 4 with this input.
- mapping should not return same number for different inputs.

### Analysing Effectiveness

