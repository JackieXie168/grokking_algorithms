import Foundation

// MARK: - Quick Sort Imp

/// Implements a quick sort algorithm on an integer array
/// - Parameter sequence: Array of integers
/// - Returns: Sorted Array of integers
/// - Note: Input should not contain duplicates
/// - Complexity: `O(n logn)
/// - Important: To reach logarithmic cmoplexity (best case) – pivot element should be taken from the middle
func quickSort(_ sequence: [Int]) -> [Int] {

	/// Base case  - empty sequence
	guard !sequence.isEmpty else {
		return []
	}

	/// Get the middle index of the input
	let midIdx = sequence.count / 2

	/// Select the support element
	let pivot = sequence[mid]

	/// Divide the input array intp parts smaller and bigger than the support element
	let smallerNums = sequence.dropFirst().filter { $0 < pivot }
	let biggerNums = sequence.dropFirst().filter { $0 > pivot }

	/// Apply the function recursively on two sub-arrays on return statement
	return quickSort(smallerNums) + [pivot] + quickSort(biggerNums)
}

// MARK: - Utility Methods [Spin Off Actually]

/// Swaps the elements using the temporary variable
/// - Parameter lhs: Number
/// - Parameter rhs: Number
func swapViaTemp(_ lhs: inout Int, _ rhs: inout Int) {
	guard lhs != rhs else {
		return
	}

	if lhs != rhs {
		let temp = lhs
		lhs = rhs
		rhs = temp
	}
}

/// Swaps the elements uisng exclusive or operation
/// - Parameter lhs: Number
/// - Parameter rhs: Number
/// - Note: This method mutates input
func xorSwap(_ lhs: inout Int, _ rhs: inout Int) {

	/**
	For simplicity pretend 4 and 6 were passed in.
	They both have bit representation as follows:

	```
	lhs: Int = 4
	rhs: Int = 6

	4 		= [00000100]
	6 		= [00000110]
	4 ^=  6 	= [00000010]
	6 ^=  4 	= [00000100]
	4 ^=  6 	= [00000110]
	```
	*/

	if lhs != rhs {
		lhs ^= rhs
		rhs ^= lhs
		lhs ^= rhs
	}

}
