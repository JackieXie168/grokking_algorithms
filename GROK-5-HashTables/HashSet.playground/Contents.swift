import Foundation

class PrimitiveLinkedList {
	
	let value: Int
	var next: PrimitiveLinkedList?
	
	init(value: Int) {
		self.value = value
	}
}

class MyHashSet {

	private var bucket: [PrimitiveLinkedList?]
	
	/** Initialize your data structure here. */
	init(size: Int = 2000) {
		bucket = Array<PrimitiveLinkedList?>.init(
			repeating: nil,
			count: size
		)
	}
	
	func hashNaively(_ value: Int) -> Int {
		if bucket.isEmpty {
			print("Bucket is empty, assuming it will be 1st element")
			print("Hash for value \(value) will be \(value % 1)")
			return value % 1
		}
		
		print("Hash for value \(value) will be \(value % bucket.count)")
		return value % bucket.count
	}
	
	func add(_ key: Int) {
		let hash = hashNaively(key)
		
		if bucket[hash] == nil {
			print("No hash found, created new bucket entry")
			bucket[hash] = PrimitiveLinkedList(value: key)
		} else {
			print("Collision detected, chaining...")
			bucket[hash]?.next = PrimitiveLinkedList(value: key)
		}
	}
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */

let obj = MyHashSet(size: 0)
obj.add(1)
