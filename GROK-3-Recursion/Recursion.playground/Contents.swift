import Foundation

// MARK: - Recursion: What's in The Box?

/**
What we do here is create an array of nested arrays.
The goal is to demonstrate the effect of recursion.
Nestendess level: 3 nested boxes.
Goal: find total count.
*/

/// Convenience methods creates a box with random elements count (between 0 and 10 count)
/// Elements value can be from 0 to 10 for simplicity
/// - Returns: Box with ints
func makeBox() -> [Int] {
	(0...Int.random(in: 0...10)).map({ $0 })
}

/// Makes a pseudo-random box of boxes
/// - Returns: the box of boxes
func makeNestedBox() -> [Any] {
	/// Generate random value between 0 and 10
	let random = Int.random(in: 0...10)
	
	/// Create an array of n elements, where n = `random`
	let array = (0...random).map({ element in
		/// If the value is even
		if element % 2 == 0 {
			/// Append the value
			return element
		} else {
			/// Append the box instead
			return makeBox()
		}
	}) as [Any]
	
	return array
}

/// Calculates and returns total count of boxes recursively
/// - Parameter boxes: Boxes array, any nestedness
/// - Returns: Recursive count
/// - Complexity: O(n)
func countBoxesRecursively(_ boxes: [Any]) -> Int {
	/// Counter initialized to get it anywhere from the function
	var count = 0
	
	/// Each iteration the function extracts the next element
	for (index, _) in boxes.enumerated() {
		/// If the element is an integer, count is increased
		if let _ = boxes[index] as? Int {
			count += 1
			
			/// If it is a box of ints, function takes the box recursively
			/// Process it and then returns here ot continue the routine
		} else if let items = boxes[index] as? [Int] {
			count += countBoxesRecursively(items)
			
			/// If the flow stumbled upon the box with boxes
			/// The function will treat this case too
		} else if let items = boxes[index] as? [Any] {
			count += countBoxesRecursively(items)
		}
	}
	
	/// When we reached the end of the last element
	/// within the top-level box (`boxes`)
	/// We consider a termination case and return the count
	return count
}


/// Create first box with ints
let box0 = makeBox()

/// Increasing nestednes to 1 level
let box1 = [4, box0, 5] as [Any]

/// Increasing nestedness to 2 levels
let chest = [box1, 44, 5, 66, 7, makeBox(), 6, 6, 4, 4, box0] as [Any]

/// Increasing nestedness to 3 levels
let chests = [chest, makeNestedBox()]

/// Check the results (all calculated correctly)
countBoxesRecursively(box0)
countBoxesRecursively(box1)
countBoxesRecursively(chest)
countBoxesRecursively(chests)

// MARK: - Recursion: n!

/// Iterative factorial
/// - Parameter number: Some integer
/// - Returns: Factorial result for some integer
/// - Complexity: O(n)
func factorialIterative(_ number: Int) -> Int {
	/// The 1nd factor is the input number itself
	var res = number
	
	/// The 2nd factor `(n-1)` is declared beforehand
	var i = number - 1
	
	/// Until we reach `0` we will multilpy
	while i != 0 {
		/// The number by it's subtracted part
		res *= i
		
		/// And decrement the counter
		i -= 1
	}
	
	/// In the end we just return the res
	return res
}

/// Recursive factorial
/// - Parameter number: Some integer
/// - Returns: Factorial result for some integer
/// - Complexity: O(n)
func factorialRecursive(_ number: Int) -> Int {
	/// Base case is when number us `0`
	if number == 0 {
		/// `0! = 1`
		return 1
	} else {
		/// Return the number multiplied by `(number-1)!`
		return number * factorialRecursive(number - 1)
	}
}

/// Both of the functions return the same value (`120`)
let i = factorialIterative(5)
let r = factorialRecursive(5)

// MARK: - Recursive Sum

/// Sums the values in the array recursively
/// - Parameter numbers: Array of integers
/// - Returns: Sum
/// - Complexity: O(n)
func sum(_ numbers: [Int]) -> Int {
	var nums = numbers
	
	while numbers.count != 0 {
		let num = nums[0]
		nums.remove(at: 0)
		return num + sum(nums)
	}
	
	return 0
}

// MARK: - Find Biggest Number

/// Finds maximum value in an integers array
/// - Parameter sequence: Array of integers
/// - Returns: Maximum value
func maxValue(_ sequence: [Int]) -> Int {
	var nums = sequence
	
	/// Base case is when thre's only max value left
	if nums.count == 1 {
		return nums[0]
	}
	
	if nums[0] > nums[1] {
		nums.remove(at: 1)
		return maxValue(nums)
	} else {
		nums.remove(at: 0)
		return maxValue(nums)
	}
}


// MARK: - Recursive Binary Search

/// Finds the value in the sequence
/// - Parameters:
///   - sequence: Array of Integers
///   - query: A value to find
/// - Returns: Tuple, containing value and `true` if the search succeeds
/// - Note: `(nil, false)` is returned if the search fails
func binarySearchRecursive(_ sequence: [Int], query: Int) -> (Int?, Bool) {
	/// Array cannot be empty
	guard !sequence.isEmpty else {
		return (nil, false)
	}
	
	/// If the sole item in the array matches the quere – the algorithm finishes
	if sequence.count == 1 && sequence[0] == query {
		return (sequence[0], true)
	} else if sequence.count == 1 {
		/// Else it is assumed the search have failes
		return (nil, false)
	}
	
	/// Local variables
	var array = sequence.sorted()
	let query = query
	let lowerBound = 0
	let upperBound = sequence.count - 1
	let midIndex = (lowerBound + upperBound) / 2
	let guess = sequence[midIndex]
	
	guard lowerBound <= upperBound else {
		return sequence[0] == query ? (sequence[0], true) : (nil, false)
	}
	
	/// Binary search imp
	if guess > query {
		array = Array(array[0...midIndex - 1])
		return binarySearchRecursive(array, query: query)
	} else if guess < query {
		array = Array(array[midIndex + 1...upperBound])
		return binarySearchRecursive(array, query: query)
	} else if guess == query {
		return (guess, true)
	}
	
	return binarySearchRecursive(array, query: query)
}

let a = (0...100000).map { $0 }
binarySearchRecursive(a, query: 777)
