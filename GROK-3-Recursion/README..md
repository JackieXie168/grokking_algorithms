# CH 3 – Recursion

## Introduction

Recursion is the special state of program execution when a procedure calls itself until it reaches the termination case. After the case has been reached successive repetitions results are processed until the control returns to the first call.

Great example can be the pile of boxes, that contain nested boxes. We are to count all the boxes, including the nested ones.

```swift
/// No Nesting
let box0 = [1, 2, 3]

/// 1-lvl nesting
let box1 = [4, box0, 5] as [Any]

/// 2-lvl nesting
let chest = [box1, 44, 5, 66, 7, box1, 6, 6, 4, 4, box0] as [Any]

/// 3-lvl nesting
let chests = [chest, chest]
```

If we look at `chests` we clearly get the idea. To count each and every box in `chests` we should design an algorithm and recursion is a best fit for the task.
It can be pronounced as: 

- Look inside each box and count items one-by-one. 
- If one of the items inside is a box, look inside the box and count items one-by-one. 
  - If one...
    - When reached the end of the box, go to the next one.
- When reached the end of the list, return the count.

The termination case here will be `reached the end of the box`. Recureisve case will invoke if the item is a box.

See [Grokking-Algorithms-Study-Notes](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-3-recursion)/[GROK-3-Recursion](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-3-recursion/GROK-3-Recursion)/[Recursion.playground](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-3-recursion/GROK-3-Recursion/Recursion.playground)/[Contents.swift](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/find/GROK-3-recursion) for recursive count implementation with comments and examples.

So that's the power of recursion. It is so well received becasue when speaking of recursively solving problems, iterative decisions stand aside as they take much more resource. Although nothing is perfect, it will be discussed later.

## Base and Recursive Cases

These are two main counterparts of each recursive function. 

- The base case is the iteration on which the procedure acknowledges it should terminate. 
- The recursive case is the iteration on which the procedure should call itself.

See [Grokking-Algorithms-Study-Notes](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-3-recursion)/[GROK-3-Recursion](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-3-recursion/GROK-3-Recursion)/[Recursion.playground](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/tree/GROK-3-recursion/GROK-3-Recursion/Recursion.playground)/[Contents.swift](https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/find/GROK-3-recursion) -> `Recursion: n!` for iterative and recursive factorial implementation with base and recursive cases explanation.

Recursion can cost lots of resources, explained in the end of the **Call Stack** section.

## Call Stack

When muptiple interrelated functions are called – stack trace is formed. As known, the stack is the simple data structure.

See https://github.com/DimkaIsALifelongLearner/Grokking-Algorithms-Study-Notes/blob/GROK-3-recursion/GROK-3-Recursion/Stack.playground/Contents.swift for Stack implementation with some methods.

Consider the case:

```swift
func greet(_ name: Stirng) {
  print("Hello, \(name)!")
  wow(name)
}

func wow(_ name: String) {
  print("\n Wow, \(name), you look great today!")
}

greet("Tupoj")
```

Call stack lifecycle:

1. memory block for `greet` call is allocated
2. block is used: all arguments, local scope variables etc are stored in this block
3. `greet` is calling `wow` and stands by
4. memory block for `wow` call is allocated
5. `wow` is called and finished execution
6. control returns to `greet`
7. `greet` finishes execution

With recursive functions call stack count will be equal to required number of recursuve cases invoked.

So the stack of `factorialRecutsive(4)` wold be

1. `fatotrial(0)`:  n = 1
2. `fatotrial(1)`:  n = 1
3. `fatotrial(2)`:  n = 2
4.  `fatotrial(3)`: n = 3
5. `fatotrial(4)`:  n = 4

Each call in the stack has it's own piece of memory for at least storing `n`. So when the stack will be filled with it's topmost element (aka the last call in the stack), the stack will `pop` the elements each time their execution finish on-by-one. When the stack reaches the `bottom`, the recursive function finally reaches the base case and terminates.

The main con of the stack is it's size-count dependency. Large stack of 100 calls of massive algorithms can cost lots of memory. In some cases it is better to refactor the recursive code to loop-like to save on memory.