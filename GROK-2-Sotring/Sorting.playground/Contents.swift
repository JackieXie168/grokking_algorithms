import Foundation

class ArraySort {
	
	/// Returns the index of the smallest number in the collection
	/// - Parameter sequence: integer array
	/// - Returns: index of the smallest number tin the collection
	public func findSmallestIndex(_ sequence: [Int]) -> Int {
		/// Assume the first item in the collection is the smallest
		var smallest = sequence[0]
		
		/// Preserve assumed smallest index beforehand
		var smallestIndex = 0
		
		/// Traversing over the collection in search of element
		/// that is less tham the assumed smallest number
		for (index, number) in sequence.enumerated() {
			/// If next number is less then the assumed smallest
			if number < smallest {
				/// It becomes the new smallest number
				smallest = number
				/// Indexe updates respectively
				smallestIndex = index
			}
		}
		
		/// Final result is returned aftere loop exit
		return smallestIndex
	}
	
	/// Returns the smallest number in the collection
	/// - Parameter sequence: integer array
	/// - Returns: the smallest number tin the collection
	public func findSmallestValue(_ sequence: [Int]) -> Int {
		sequence[findSmallestIndex(sequence)]
	}
	
	/// Returns the index of the biggest number in the collection
	/// - Parameter sequence: integer array
	/// - Returns: index of the biggest number tin the collection
	public func findBiggestIndex(_ sequence: [Int]) -> Int {
		/// Assume the first item in the collection is the biggest
		var biggest = sequence[0]
		
		/// Preserve assumed biggest index beforehand
		var biggestIndex = 0
		
		/// Traversing over the collection in search of element
		/// that is less tham the assumed biggest number
		for (index, number) in sequence.enumerated() {
			/// If next number is less then the assumed biggest
			if number > biggest {
				/// It becomes the new biggest number
				biggest = number
				/// Indexe updates respectively
				biggestIndex = index
			}
		}
		
		/// Final result is returned aftere loop exit
		return biggestIndex
	}
	
	/// Returns the biggest number in the collection
	/// - Parameter sequence: integer array
	/// - Returns: the biggest number tin the collection
	public func findBiggestValue(_ sequence: [Int]) -> Int {
		sequence[findBiggestIndex(sequence)]
	}
	
	/// Sorts the array ascending
	/// - Parameter input: integer array
	/// - Important: this function mutates the original array
	func sortAscending(input: inout [Int]) {
		/// Result replica
		var res = [Int]()
		
		/// Number of iterations
		var count = input.count
		
		/// Smallest index
		var smallestIndex = 0
		
		/// And assumed smallest value
		var smallestValue = input[smallestIndex]
		
		/// We need to extract each smallest number from the array
		/// until is is drained completely, so the number of iterations
		/// obviously equals the quantity of elements in the array.
		while count != 0 {
			/// Each time finding smallest index
			smallestIndex = findSmallestIndex(input)
			
			/// And smallest value
			smallestValue = findSmallestValue(input)
			
			/// Smallest value is appended to the array
			res.append(smallestValue)
			
			/// And then removed from the array
			input.remove(at: smallestIndex)
			
			/// Counter decrement
			count -= 1
		}
		
		/// After the loop finishes the new array replica is applied to input array
		input = res
	}
	
	/// Sorts the array descending
	/// - Parameter input: integer array
	/// - Important: this function mutates the original array
	func sortDescending(input: inout [Int]) {
		/// Result replica
		var res = [Int]()
		
		/// Number of iterations
		var count = input.count
		
		/// Biggest index
		var biggestIndex = 0
		
		/// And assumed biggest value
		var biggestValue = input[biggestIndex]
		
		/// We need to extract each biggest number from the array
		/// until is is drained completely, so the number of iterations
		/// obviously equals the quantity of elements in the array.
		while count != 0 {
			/// Each time finding biggest index
			biggestIndex = findBiggestIndex(input)
			
			/// And smallest value
			biggestValue = findBiggestValue(input)
			
			/// Smallest value is appended to the array
			res.append(biggestValue)
			
			/// And then removed from the array
			input.remove(at: biggestIndex)
			
			/// Counter decrement
			count -= 1
		}
		
		/// After the loop finishes the new array replica is applied to input array
		input = res
	}
}
