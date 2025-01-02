class Node<T> {
    var value: T
    var next: Node?
    weak var previous: Node?

    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    private var head: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<T>? {
        return head
    }

    var last: Node<T>? {
        guard var node = head else {
            return nil
        }

        while let next = node.next {
            node = next
        }
        return node
    }

    var count: Int {
        guard var node = head else {
            return 0
        }

        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }

    subscript(index: Int) -> T {
        let node = node(atIndex: index)
        return node!.value
    }

}

//MARK: Append
extension LinkedList {
    func append(value: T) {
        let newNode: Node<T> = Node(value: value)
        if let lastNode = last  {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
}

//MARK: Search
extension LinkedList {
    func node(atIndex index: Int) -> Node<T>? {
        if count > index {
            if index == 0 {
                return head!
            } else {
                var node = head!.next
                for _ in 1..<index {
                    node = node?.next
                    if node == nil {
                        break
                    }
                }
                return node!
            }
        }
        return nil // OutOfIndex (or No Node)
    }
}

//MARK: Remove
extension LinkedList {
    func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev

        node.previous = nil
        node.next = nil
        return node.value
    }
}

let ll = LinkedList<Int>()

ll.append(value: 1)
ll.append(value: 2)
ll.append(value: 3)

print("count: \(ll.count)")

print(ll.node(atIndex: 1)!.value)

print(ll[0])
print(ll[2])
print(ll.remove(node: Node<Int>(value: 3)))
// print(ll[2]) // Error