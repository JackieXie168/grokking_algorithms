/// Node implementation to support linked list
/// - Note: `indirect` used to override recursive references of value types
/// https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
/// see `Recursive Enumeration` section
public enum Node<Element> {
	
	/// Node does not have a value and the next element
	case empty
	
	/// Node has value and a next node that can be either empty or with value
	/// - Parameters:
	///   - value: Value that is stored in the enum in case it is not empty
	///   - next: Next node, if any
	indirect case filled(_ value: Element, next: Node<Element>)
}

extension Node {
	
	/// Appends the new element at the end of the collection
	/// - Parameter element: Node, containing value of a conforming type
	mutating func add(_ element: Element) {
		
		/// If the node is `.empty`, the value is simply added (fallback)
		/// `value` is declared as `constant` as it's not amended during the execution
		/// `next` should be mutable, as we assign a new case to it
		guard case .filled(let value, var next) = self else {
			self = .filled(element, next: .empty)
			return
		}
		
		/// Recursively fire the func to ensure it hit the very last node in list
		next.add(element)
		
		/// Assign the last most node to a `.filled`
		self = .filled(value, next: next)
	}
	
	/// Removes the last element of the collection and returns it
	/// - Returns: The last node
	/// - Note: Function result can be discarded
	@discardableResult
	mutating func removeFirst() -> Element? {
		
		/// If head is empty -> return `nil`
		guard case let .filled(value, next) = self else {
			return nil
		}
		
		/// Else assign `next` as `head`
		self = next
		
		/// And return the cut-off value
		return value
	}
}


/// Implements the linked list backed by the recursive enums
// TODO: - Decide how to make it better
/// <#Description#>
struct LinkedList<Element> {
	
	/// Recursive head
	var head: Node<Element>
	
	/// Returns the last element of the collection
	var last: Node<Element>? {
		
		/// Check that head is not empty, otherwis return `nil`
		guard case let .filled(_, next: node) = head else {
			return nil
		}
		
		/// Backup for local scope
		var _last = node
		
		/// Iterative search for last value
		searchLoop:
		
		/// While the proccessed node remains filled
		while case let .filled(_, nextNode) = _last {
			
			/// Check whether the next's next is filled too
			if case .filled = nextNode {
				
				/// And assign the next's next if filled
				_last = nextNode
				
				/// Break the loop if the next node is empty
			} else if case .empty = nextNode {
				break searchLoop
			}
		}
		
		/// Return the result
		return _last
	}
	
	
	/// Appends the element to the end of the collection
	/// - Parameter element: Node with value of conforming type
	mutating func add(_ element: Element) {
		head.add(element)
	}
	
	/// Removes the last element of the collection and returns it
	/// - Returns: The last node
	/// - Note: Function result can be discarded
	@discardableResult
	mutating func removeFirst() -> Element? {
		head.removeFirst()
	}
}
