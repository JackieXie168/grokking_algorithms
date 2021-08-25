// MARK: - Hashing Funcs Imp

/**
- This section introcudes some implementations of popular hashing algorithms and hash tables
- Additional Sources:
- http://www.cse.yorku.ca/~oz/hash.html
- https://www.raywenderlich.com/206-swift-algorithm-club-hash-tables

- Goals:
- understand what hashing is and why it is important;
- how it maps to hash tables;
- play with some algorithms;
- implement a hash table.
*/

/// Hashes the input string naively
/// - Parameter input: String
/// - Returns: Hasр string's corresponding unicode scalars
public func naiveHash(_ input: String) -> Int {
	
	/// Nothing special here: all input chars are mapped to their corresponding unicode numbers
	let unicodeScalars = input.unicodeScalars.map { Int($0.value) }
	
	/// After the numbers were mapped, they're summed up and returned
	/// For example:
	///
	///		naiveHash("AAA") -> [65, 65, 65].reduce(0, +) -> 195
	return unicodeScalars.reduce(0, +)
}

/// Hashes the input string using Bernstein's algorithm
/// - Parameter input: String
/// - Returns: Hasg string's corresponding unicode scalars
public func djb2Hash(_ input: String) -> Int {
	
	/// Input is again mapped to numbers
	let scalars = input.unicodeScalars.map{ $0.value }
	
	/// The number `5831` is used in testing and resulted in fewer `collisions` and better `avalanching`
	///
	/// - Note: A collision occurs when more than one value to be hashed by a particular hash
	/// function are mapped to the same slot in the table or data structure (hash table).
	/// http://www.umsl.edu/~siegelj/information_theory/projects/HashingFunctionsInCryptography.html
	///
	/// - Note: A hash function demonstrates the `avalanche` effect if a single flipped bit
	/// in the input causes a change of, on average, half the bits of the output.
	/// https://www.wolfram.com/language/12/cryptography/demonstrate-the-avalanche-effect-of-a-hash-function.html
	return scalars.reduce(5831) {
		
		/// Technically this is an operation of multiplying by `33`:
		///
		///		$0 * 33 + $0
		///
		/// But on most CPU;s it's bitShift equivalent is faster.
		/// For example:
		///
		///		[1]		Int(5)   << 5 + Int(5)   = 5 * 33 - base equation
		///		[2]		00000101 << 5 + 00000101 = 5 * 33 - binary conversion
		///		[3]		10100000      + 00000101 = 5 * 33 - bits shifted (160 in res)
		///		[4]		10100101                 = 5 * 33 - bits added (150 in res)
		///		[5]		165                      = 165
		///
		/// Therefore the bitArray of a number, shifted by 5 to left and summed with itseld before shift
		/// results in operation equal to multiplying this number by 33.
		($0 << 5) &+ $0 &+ Int($1)
	}
}

// MARK: - Utilities

/// Obtains the index of the bucket in the hash-table
/// - Parameters:
///   - hash: Content hash
///   - size: Array size (all buckets count)
/// - Returns: Index of the element
public func getIndex(from hash: Int, _ size: Int) -> Int {
	return abs(hash) % size
}

// MARL: - Hash Table Imp

/// Implements basic logic for hash table
/// - Parameters:
///   - Key: Hashable value that corresponds to the element's content
///   - Value: Element's content
public struct HashTable<Key: Hashable, Value> {
	
	// MARK: - Private
	
	/// Shorthand for element representation `[Key: Value]`
	private typealias Element = (key: Key, value: Value)
	
	/// Bucket is an array of elements as per theory
	private typealias Bucket  = [Element]
	
	/// This is the bucket array itself
	private var buckets: [Bucket]
	
	/// Returns total count of the table
	/// - Note: cannot be set outside obviously
	private(set) var count = 0
	
	// MARK: - Public
	
	/// Returns `true` if the table is empty
	public var isEmpty: Bool {
		return count == 0
	}
	
	/// Returns the first element of the collection
	//	public var first: Value {
	//
	//	}
	
	/// Returns the last element of the collection
	//	public var last: Value {
	//
	//	}
	
	/// Returns the textual representation of the hash table
	//	public var description: String {
	//
	//	}
	
	// MARK: - Initialization
	
	/// Instantiates the copy of hashTable
	/// - Parameter capacity: Table length
	public init(capacity: Int) {
		assert(capacity > 0)
		
		buckets = Array<Bucket>(
			repeating: [],
			count: capacity
		)
	}
	
	// MARK: - CRUD: Create
	
	// MARK: - CRUD: Read
	
	//	func element(at index: Int) -> Element {  }
	
	func value(for key: Key) -> Value? {
		let index = self.index(for: key)
		
		return buckets[index].first { $0.key == key }?.value
	}
	
	//	func elements(at indexes: [Int])  -> [Element] {  }
	
	//	func elements(at indexes: Int...) -> [Element] {  }
	
	//	func values(at indexes: [Int])  -> [Value] {  }
	
	//	func values(at indexes: [Int])  -> [Value] {  }
	
	// MARK: - CRUD: Update
	
	/// Update the value or set new value if key if not found
	/// - Parameters:
	///   - value: The value to be assigned to a element
	///   - key: The key to match the element in the collection
	/// - Returns: Old value or absence of value if key matched no value
	@discardableResult
	public mutating func set(value: Value, for key: Key) -> Value? {
		
		/// Get the index
		let index = index(for: key)
		
		/// Try to match first value that matches index and the key
		if let (i, _) = buckets[index].enumerated().first(where: {
			$0.1.key == key
		}) {
			let oldValue = buckets[index][i].value
			buckets[index][i].value = value
			return oldValue
		}
		
		/// If nothing is found, the value is set as new
		buckets[index].append((key: key, value: value))
		count += 1
		
		return nil
	}
	
	func set(values: [Int], at indexes: [Int]) {  }
	
	func set(values: Int..., at indexes: Int...) {  }
	
	// MARK: - CRUD: Delete
	
	/// Removes the value from the element
	/// - Parameter key: The key to match the element in the collection
	/// - Returns: Old value or absence of value if key matched no value
	@discardableResult
	public mutating func removeValue(for key: Key) -> Value? {
		
		/// Get the index
		let index = index(for: key)
		
		/// If something matched
		if let (i, element) = buckets[index].enumerated().first(where: {
			$0.1.key == key
		}) {
			
			/// Remove the element and decrease the count
			buckets[index].remove(at: i)
			count -= 1
			return element.value
		}
		
		/// Or return nothing if nothing matched
		return nil
	}
	
	func removeElements(at indexes: [Int]) {  }
	
	func removeElements(at indexes: Int...) {  }
	
	func removeAll() {  }
	
	func dropFirst() {  }
	
	func dropFirst(_ items: Int) {  }
	
	func dropLast(_ items: Int) {  }
	
	// MARK: - Utility
	
	/// Returns element's index by key
	/// - Parameter key: Element's key
	/// - Returns: Index for the element
	private func index(for key: Key) -> Int {
		
		/// Output is constrained to the size of the array
		return abs(key.hashValue) % buckets.count
	}
	
	/// Allows for `[]` access syntax
	public subscript(key: Key) -> Value? {
		get {
			return value(for: key)
		}
		
		set {
			if let value = newValue {
				set(value: value, for: key)
			} else {
				removeValue(for: key)
			}
		}
	}
}
