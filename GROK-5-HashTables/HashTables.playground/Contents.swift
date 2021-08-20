// MARK: - Hashing Func Imp

/**
 - Note: all implementations are taken from here:
 

 - This section introcudes some implementations of popular hashing algorithms and hash tables
 - Additional Sources:
	- http://www.cse.yorku.ca/~oz/hash.html
	- https://www.raywenderlich.com/206-swift-algorithm-club-hash-tables

 - Goals:
	 - Understand what hashing is and why it is important
	 - How it maps to hash tables
	 - Play with some algorithms
	 - Implement a hash table
*/

/// Hashes the input string naively
/// - Parameter input: String
/// - Returns: Hasр string's corresponding unicode scalars
func naiveHash(_ input: String) -> Int {
	let unicodeScalars = input.unicodeScalars.map { Int($0.value) }
	return unicodeScalars.reduce(0, +)
}

/// Hashes the input string using Bernstein's algorithm
/// - Parameter input: String
/// - Returns: Hasg string's corresponding unicode scalars
func djb2Hash(_ input: String) -> Int {
	let scalars = input.unicodeScalars.map{ $0.value }
	return scalars.reduce(5831) {
		($0 << 5) &+ $0 &+ Int($1)
	}
}

func sdbmHash(_ input: String) -> Int {
	let scalars = input.unicodeScalars.map({ Int($0.value) })
	return scalars.reduce(0) {
		$1 &+ ($0 << 6) &+ ($0 << 16) - $0
	}
}


func divideIntoParts(_ input: Double) -> (Double, Double) {
  let randomUpperBound = Double.random(in: 0.0...0.61)
  let random = Double.random(in: 0...Double(input)*randomUpperBound)

  return (random, input - random)
}

print(divideIntoParts(5000.0))

// (2354.392553621411, 2645.607446378589)
// это не 4, а надо 4

