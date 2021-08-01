import Foundation

// MARK: - Declare

/// Node that holds some integer value and a reference to the next node
class Node<T: BinaryInteger>: CustomStringConvertible {
	
	// MARK: - Properties
	
	/// Some value, conforming to BinaryInteger protocol
	public var value: T
	
	/// Next item in the node (implementing linked list mechanics)
	public var next: Node<T>?
	
	/// Fetch integer from the node's data
	public var intValue: Int {
		return value as! Int
	}
	
	/// Textual representation of node's value
	public var description: String {
		guard let next = next else {
			return "\(value)"
		}
		
		return "\(value) –> \(String(describing: next)) "
	}
	
	// MARK: - Initialization
	
	/// Instantiates the new copy of Node with no `next`
	/// - Parameter data: Some number, conforming `BinaryInteger`
	init(data: T) {
		self.value = data
		next = nil
	}
	
	// MARK: - Methods
	
	func set(value: Int) {
		self.value = value as! T
	}
}

/// Singly linked list that accepts node with some number
class SinglyLinkedList<T: BinaryInteger>: CustomStringConvertible {
	
	// MARK: - Private
	
	/// List's head
	private var _head: Node<T>
	
	/// Returns how many items are in the list
	private var _count: Int = 0
	
	/// Returns the last element in the sequence
	/// - Returns: last element in the sequence
	private func _last() -> Node<T>? {
		/// If there is 1 item in the list, it is the `first` and the `last`
		guard _head.next != nil else {
			return _head
		}
		
		/// Backing up head
		let headBackup = _head
		
		/// Returned last element
		var output: Node<T>?
		
		/// While we still can reach the `next`
		while let nextElement = _head.next {
			/// We store the `nextElement` in the `output`
			output = nextElement
			
			/// And reassign the `head` to move on
			/// Further in the next iteration
			_head = nextElement
		}
		
		/// Restoring `head` in it's original state
		_head = headBackup
		
		return output
	}
	
	// MARK: - Initialization
	
	/// Instantiates the list with at least one node
	/// - Parameter firstNode: node
	/// - Parameter tail: optional tail
	init(firstNode: Node<T>, tail: Node<T>? = nil) {
		guard firstNode.next == nil else {
			fatalError(
				"Initialization with chained nodes is not yet implemented."
			)
		}
		
		_head = firstNode
		_count += 1
	}
	
	// MARK: - Quick Access Properties
	
	/// `true` if `count` == 0
	public var isEmpty: Bool {
		return _count == 0
	}
	
	/// Returns the head
	public var first: Node<T>? {
		return _head
	}
	
	/// Returns the last element of the collection
	public var last: Node<T>? {
		_last()
	}
	
	/// Shows how many items are in the list
	public var count: Int {
		return _count
	}
	
	/// Instance textual representation
	public var description: String {
		return String(describing: _head)
	}
	
	/// Shows the entire list content in a `String` representation
	public var descriptionSeparated: String {
		guard _count > 1 else {
			return _head.description
		}
		
		var text = "["
		var node = _head
		
		while node.next != nil {
			text.append("\(node.value)")
			node = node.next!
			
			if node.next != nil {
				text.append(", ")
			} else {
				text.append(", \(node.value)]")
			}
		}
		
		return text
	}
	
	// MARK: - CRUD: Create
	
	/// Adds the item to the beginning of the list
	/// - Parameter element: number to store next
	public func push(_ element: T) {
		/// Fresh instance of `Node` is initialized with the number `element`
		let node = Node<T>(data: element)
		
		/// As the list fills itself by a stacked like nature, the `node` should be the `head`
		/// So the head should be the `node` next
		node.next = _head
		
		/// While `head` reference is preserved in the `next` property of `node`
		/// It is safe now for `head`to refer to the node.
		_head = node
		
		/// Counter incremented
		_count += 1
	}
	
	/// Appends the items to the list (push many)
	/// - Parameter elements: numbers array
	public func push(_ elements: [T]) {
		elements.forEach({ push($0) })
	}
	
	/// Appends the items to the list (push many)
	/// - Parameter elements: numbers array
	public func push(_ elements: T...) {
		elements.forEach({ push($0) })
	}
	
	/// Adds the item to the end of the list
	/// - Parameter element: number to store next
	public func append(_ element: T) {
		let element = Node(data: element)
		
		let last = _last()
		last?.next = element
	}
	
	/// Adds an array of integers to the end of the list
	/// - Parameter elements: numbers to store next
	public func append(_ elements: [T]) {
		elements.forEach({ append($0) })
	}
	
	/// Adds an array of integers to the end of the list
	/// - Parameter elements: numbers to store next
	public func append(_ elements: T...) {
		elements.forEach({ append($0) })
	}
	
	/// Inserts a value at a specific index
	/// - Parameters:
	///   - index: element's position numeric representation
	///   - value: numeric value
	public func insert(at index: Int, value: T) {
		guard index != 0 else {
			push(value)
			return
		}
		
		guard index > 0 else {
			return
		}
		
		guard index <= _count else {
			fatalError("Index is out of range")
		}
		
		let nodeAtIndex = node(atIndex: index)
		let previousNode = node(atIndex: index - 1)
		let node = Node(data: value)
		
		node.next = nodeAtIndex
		previousNode?.next = node
	}
	
	// MARK: - CRUD: Read
	
	/// Get node at specific inedx
	/// - Parameter atIndex: numeric value of element's index
	/// - Returns: Node object
	public func node(atIndex: Int) -> Node<T>? {
		guard _count > atIndex else  {
			return nil
		}
		
		guard atIndex > 0 else {
			return _head
		}
		
		var counter = atIndex
		var nodeAtIndex: Node<T>?
		let headBackup = _head
		
		while _head.next != nil && counter != 0 {
			nodeAtIndex = _head.next!
			_head = _head.next!
			counter -= 1
		}
		
		_head = headBackup
		
		return nodeAtIndex!
	}
	
	/// Get node's value at specific index
	/// - Parameter atIndex: numeric value of element's index
	/// - Returns: Node's integer value
	public func value(atIndex: Int) -> Int? {
		return node(atIndex: atIndex)?.intValue
	}
	
	/// Get node's values at multiple indexes
	/// - Parameter atIndexes:
	/// - Returns: /// - Parameter atIndex: numeric values of element's index
	/// - Returns: Node's integer values
	public func values(atIndexes: [Int]) -> [Int] {
		var values = [Int?]()
		atIndexes.forEach({ values.append(value(atIndex: $0)) })
		return values.compactMap({$0})
	}
	
	/// Get node's values at multiple indexes
	/// - Parameter atIndexes:
	/// - Returns: /// - Parameter atIndex: numeric values of element's index
	/// - Returns: Node's integer values
	public func values(atIndexes: Int...) -> [Int] {
		var values = [Int?]()
		atIndexes.forEach({ values.append(value(atIndex: $0)) })
		return values.compactMap({$0})
	}
	
	// MARK: - CRUD: Update
	
	/// Amends the target element value
	/// - Parameters:
	///   - value: value to be updated
	///   - index: element's position
	public func set(value: Int, at index: Int) {
		node(atIndex: index)?.set(value: value)
	}
	
	/// Amends the target elements values
	/// - Parameters:
	///   - value: value to be updated
	///   - index: element's position
	public func set(values: [Int], at indexes: [Int]) {
		var i = 0
		
		indexes.forEach {
			set(value: values[i], at: $0)
			i += 1
		}
	}
	
	// MARK: - CRUD: Delete
	
	/// Removes node at a specific index
	/// - Parameter index: node index
	public func removeNode(at index: Int) {
		guard index != 0 else {
			fatalError("Nil head is not implemented yet")
		}
		
		guard index > 0 else {
			fatalError("Index out of range")
		}
		
		guard index <= _count else {
			fatalError("Index is out of range")
		}
		
		let previousNode = node(atIndex: index - 1)
		var nodeAtIndex = node(atIndex: index)
		let nextNode = node(atIndex: index + 1)
		
		previousNode?.next = nextNode
		nodeAtIndex = nil
	}
	
	/// Removes nodes at a specific indexes
	/// - Parameter index: nodes indexes
	public func removeNodes(at indexes: [Int]) {
		indexes.forEach({ removeNode(at: $0) })
	}
	
	/// Removes nodes at a specific indexes
	/// - Parameter index: nodes indexes
	public func removeNodes(at indexes: Int...) {
		indexes.forEach({ removeNode(at: $0) })
	}
	
	/// Pops first element
	public func pop() {
		guard let next = _head.next else {
			fatalError("Nil head is not implemented yet")
		}
		
		_head = next
	}
	
	/// Drop the last node of the collection
	/// - Returns: last dropped element
	public func dropLast() -> Node<T> {
		guard _head.next != nil else {
			fatalError("Dropping is not implemented yet")
		}
		
		var previousNode = _head
		var currentNode = _head
		
		while let next = currentNode.next {
			previousNode = currentNode
			currentNode = next
		}
		
		previousNode.next = nil
		
		return currentNode
	}
	
	/// Detaches head from the list, actually leaving the list
	/// with one value
	public func detachHead() {
		_head.next = nil
	}
	
	// MARK: - Utility Methods
	
	/// Loops through the list and gets the count in "recursive" style
	/// - Returns: Number of items in the list
	public func getCountRecursively() -> Int {
		/// If `head` has no next item, obviously count will be `1`
		guard _head.next != nil else {
			return 1
		}
		
		/// Initialized list has always at least `1` item
		var count = 1
		
		/// As belowe there will be bloody permutations of `head`
		/// I did no find the better thing to preserve the head, as simply
		/// Assign it ti the local var that will be used later
		let headBackup = _head
		
		/// While we still can reach the head's `next` element
		while let next = _head.next {
			/// We substitute the current `head` with  it's own `next`
			/// So the next time the loop will iterate, the `head` will be one
			/// Step closer to the list's end
			_head = next
			
			/// And, ofc, incrementing the counter
			count += 1
		}
		
		/// After the loop has finished iterating
		/// The `head` is restored from the original state
		_head = headBackup
		
		/// `_count` is not always updated properly so it's better to update it here
		if count > _count {
			_count = count
		}
		
		/// Returned aggregated `count`
		return count
	}
	
	/// Reverses all items' order
	public func reverse() {
		/// Placeholder for previous node
		var previousNode: Node<T>? = nil
		
		/// Startong point, actually the first node
		var currentNode = _head
		
		/// Next node
		var nextNode = _head.next
		
		/// While we still can reach the next node
		while nextNode != nil {
			/// Nillifying the first element's `next`
			currentNode.next = previousNode
			
			/// Setting current (amended) node aside
			previousNode = currentNode
			
			/// Making 1 step forward
			currentNode = nextNode!
			
			/// Making 1 step forward
			nextNode = currentNode.next
		}
		
		/// In the end set the last `previous` node as the continuation of the current
		currentNode.next = previousNode
		
		/// Set the `_head`
		_head = currentNode
	}
	
}
