# CH 1 – Introduction

## Binary Search

Works with sorted array of data. Returns `null` if nothing found. Sorting is neede as binary search guesses from the midpoint of search range, thus sutting the population by half.
So if input population count was 100, it will transform this way: `100 –> 50 –> 25 –> 13 –> 7 –> 4 –> 2 –> 1`. Only 7 steps needed.

## Logarithm

It is the opposite to the exponentiation. Logarithm is answering the question (for isntance) how many times should 10 be multiplied by itself to form 100?.

```swift
/// Some examples to get what logarithm is and how it is interconnected with exponentiation
log10(100)  = 2 <––> 10^2 = 100;
log5(25)    = 2 <––> 5^2  = 25;
log2(8)     = 3 <––> 2^3  = 8.
```

Binary search has `O(log2)` complexity, so to calculate how much time will be needed to run each population, one should calculate the log.

```swift
/// Some examples of how different populations [p] play-out with binary search
p = 32  -> log2(24)  = 5 -> 2^5 = 35;
p = 121 -> log2(128) = 7 -> 2^7 = 128;
p = 500 -> log2(500) = 9 -> 2^9 = 512.

/// Sot to get the search result of 500 items big population, one need only 9 steps
```

