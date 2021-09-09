// MARK: - Utilities

/// Obtains the index of the bucket in the hash-table
/// - Parameters:
///   - hash: Content hash
///   - size: Array size (all buckets count)
/// - Returns: Index of the element
public func getIndex(from hash: Int, _ size: Int) -> Int {
	return abs(hash) % size
}
