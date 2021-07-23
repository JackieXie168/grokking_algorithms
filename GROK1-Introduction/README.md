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

**TL, DR:** to calculate how may attempts it will take to find the queried item, just calculate `log2(n)`, where `n` is the size of the input array, some examples here:

- n = 240  –> `log2(240)` -->  ~8
- n = 3      –> `log2(3)`     -->  ~2
- n = 53    –> `log2(53)`   -->  ~6

## Time Complexity

Algorithm execution time is not measured in seconds. Instead, it's potential increase in operations that's what matters. Put it simply, we meed to know, what increase in time to expect if we multiply the count of input population by 2, 300, 1000, 2*10^5...

TIme complexity of binary search is `logarithmic`. That means number of attempts the algorithm will need would be the result of `log2(n)`, where `n` is the size of the input array. 

The main trait of the logarithmic time is that it increases no so fast, as linear time. For example:

- array was 10 items long and became 100;
- linear time will transform from 10 to 100 (x10);
- logarithmic time will transform from 3 to 6 (x2);

So how to calculate algorithm time increase based on the increase of input population? Here Big "O" sets in.

## Big "O" Notation

Big "O" shows how many 'atomic' operations the algorithm will need to complete the execution. The number of the operations increase with the size of the input population.

Big "O" shows the worst time that can be spent on algorithm execution.
