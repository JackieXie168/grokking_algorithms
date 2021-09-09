// MARK: - Hash Set Imp

struct HashSet<T: Hashable> {
	
	var bucketArray = Dictionary<T, Bool>()
	
	mutating func insert(_ element: T) {
		bucketArray[element] = true
	}
	
	mutating func remove(_ element: T) {
		bucketArray[element] = nil
	}
	
	mutating func removeAll() {
		bucketArray.removeAll()
	}
	
	func contains(_ element: T) -> Bool {
		guard bucketArray[element] != nil else {
			return false
		}
		return true
	}
}

extension HashSet {
	
	subscript(_ element: T) -> Bool? {
		guard bucketArray[element] != nil else {
			return nil
		}
		return true
	}
}

// MARK: - Hash Table Imp

struct HashMap<E: Hashable> {
	
	
}

print("return 0!")
