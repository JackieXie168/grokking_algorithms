import Foundation

// MARK: - Declare

class Node<T> {
    
    var data: T
    
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
        next = nil
    }
    
}

class LinkedList<T> {
    
    // MARK: - Private
    
    private var head: Node<T>?
    
    private var count: Int = 0
    
    init() {  }
    
    // MARK: - Initialization
    
    init(firstNode: Node<T>) {
        head = firstNode
        count += 1
    }
    
    // MARK: - Public
    
    public var isEmpty: Bool {
        return count == 0 ? true : false
    }
    
    public var first: Node<T>? {
        return head != nil ? head : nil
    }
    
    public var len: Int {
        return count
    }
    
    public func push(_ element: T) {
        let node = Node<T>(data: element)
        node.next = head
        head = node
        count += 1
    }
    
    public func push(_ elements: [T]) {
        elements.forEach({ push($0) })
    }
    
    public func loopCount() -> Int {
        var count = head == nil ? 0 : 1
        let headBackup = head
        
        while let next = head?.next {
            head = next
            count += 1
        }
        
        head = headBackup
        
        return count
    }
    
    public func last() -> Node<T>? {
        guard head != nil else {
            print("nil head")
            return nil
        }
        
        guard count > 1 else {
            return head
        }
        
        let headBackup = head
        
        var output: Node<T>?
        
        while let nextElement = head?.next {
            output = nextElement
            head = nextElement
        }
        
        head = headBackup
        
        return output
    }
}

let node = Node(data: 88)
let linkedList = LinkedList(firstNode: node)
linkedList.first?.data
linkedList.last()?.data
linkedList.push([4, 3, 2, 1])
linkedList.loopCount()
linkedList.last()?.data
linkedList.loopCount()
linkedList.first?.next?.next?.data
