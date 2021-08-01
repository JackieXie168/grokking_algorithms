import Foundation

// MARK: - Stack Imp

/// Type implementing the main stack behaviour with integers as example
/// - Note: last item is considered the `top` of the stack
/// - Important: Swift `Colleciton` protocol not implemented to constrain the behaviour
struct Stack<T: BinaryInteger> {
	
	// MARK: - Private
	
	/// Stored data
	private var _storage = [T]()
	
	/// Stack count
	private var _count = 0
	
	// MARK: - Initialization
	
	/// Instantiates the stack with items
	/// - Parameter items: array of objects conforming to `BinaryInteger` protocol
	public init(_ items: [T]) {
		_storage = items
	}
	
	/// Instantiates the stack with item
	/// - Parameter items: object conforming to `BinaryInteger` protocol
	public init(_ item: T) {
		_storage.append(item)
	}
	
	// MARK: - Methods
	
	/// Add element to the top of the stack
	/// - Parameter item: Some item conforming to `BinaryInteger` protocol
	/// - Complexity: `O(1)`
	public mutating func push(_ item: T) {
		_storage.append(item)
		_count += 1
	}
	
	
	/// Removes the topmost element
	/// - Returns: The former topmost element
	/// - Complexity: O(1)
	/// - Note: `@discardableResult` used since the return value is not always needed
	@discardableResult
	public mutating func pop() -> T {
		_count -= 1
		return _storage.remove(at: _storage.firstIndex(of: _storage.last!)!)
	}
	
	/// Reverses the stack
	/// - Important: This method has side-effects
	/// - Complexity: `O(n)`, where `n` = last index number
	public mutating func reversed() {
		
		var newStorage = [T]()
		var i = _storage.count - 1
		
		while let item = _storage.last, i >= 0 {
			newStorage.append(item)
			print(newStorage)
			pop()
			i -= 1
		}
		
		_storage = newStorage
		
		print("[REVERSED] \n \(description)")
		
	}
	
	// MARK: - Convenience
	
	/// Returns the topmost element of the collection
	public func peek() -> T? {
		_storage.last
	}
	
	/// `true` if the stack lacks items
	public var isEmpty: Bool {
		_count == 0 && _storage.count == 0
	}
	
	/// Stack count (public)
	public var count: Int {
		_count
	}
	
}

/// Stack textual representation
extension Stack: CustomStringConvertible {
	
	public var description: String {
		"""
		--- top ---
		\(_storage.map { "\t \($0)" }.reversed().joined(separator: "\n"))
		--- bot ---
		"""
	}
}

/// Initialize from array literal
extension Stack: ExpressibleByArrayLiteral {
	
	/// Int is taken for example
	typealias ArrayLiteralElement = Int
	
	
	/// Instantiates the stack from the array literal
	/// - Parameter elements: Some integers
	public init(arrayLiteral elements: Int...) {
		guard let array = elements as? [T] else {
			fatalError("Could not initialize from array literal")
		}
		_storage = array
	}
	
}
