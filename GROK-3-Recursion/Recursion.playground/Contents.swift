import Foundation

// MARK: - Recursion: How Many in The Boxes?

/**
What we do here is create an array of nested arrays.
The goal is to demonstrate the effect of recursion.
Nestendess level: 3 nested boxes.
Goal: find total count.
*/

/// Create first box with ints
let box0 = [1, 2, 3]

/// Increasing nestednes (up to 3)
let box1 = [4, box0, 5] as [Any]
let chest = [box1, 44, 5, 66, 7, box1, 6, 6, 4, 4, box0] as [Any]
let chests = [chest, chest]


/// Calculates and returns total count of boxes recursively
/// - Parameter boxes: Boxes array, any nestedness
/// - Returns: Recursive count
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

// MARK: - Example with Factorial

func factorialIterative(_ number: Int) -> Int {
	var i = number - 1
	var res = number
	
	
	while i != 0 {
		res *= i
		i -= 1
	}
	
	return res
}

func factorialRecursive(_ number: Int) -> Int {
	if number == 0 {
		return 1
	} else {
		return number * factorialRecursive(number - 1)
	}
}

print(countBoxesRecursively(chests))


