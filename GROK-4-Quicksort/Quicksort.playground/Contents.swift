import Foundation

func quickSort(_ sequence: [String]) -> [String] {
	guard !sequence.isEmpty ||
			sequence.count > 1
	else {
		return sequence
	}
	
	var array = sequence
	
	if sequence.count == 2, sequence[0] > sequence[1] {
		return swapElements(&array)
	}
	
	return array
}

func swapElements(_ sequence: inout [String]) -> [String] {
	guard sequence.count == 2 else {
		return []
	}
	
	if sequence[0] != sequence[1] {
		let temp = sequence[0]
		sequence[0] = sequence[1]
		sequence[1] = temp
		
		return sequence
	} else {
		return sequence
	}
}

var a = ["1","2"]

swapElements(&a)
