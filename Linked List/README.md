# Linked List
> 노드가 있고, 노드는 자신 다음으로 어떤 노드와 연결 되어 있는지, 필요에 따라서는 자신 이전의 노드가 무엇인지를 저장하는 자료구조 이다.

- head : 시작 노드
- tail : 끝 노드

# Operations Complexity
||Append|Insert|Delete|Search|
|---|---|---|---|
|Big-O|O(1)|O(n)|O(n) (search)|O(n)|

# Singly(단일) vs doubly(이중) Linked List

이중 연결 리스트는 이전 노드도 저장 하므로 단일 연결 리스트에 비해 더 많은 메모리 공간을 필요로 한다. 하지만, 현재 노드 k에서 이전 노드를 모른다면 k-1번의 연산을 필요로 하기 때문에 알고 있는 편이 좋다.

# Implementation
## Node
```swift
class Node<T> {
    var value: T
    var next: Node?
    weak var previous: Node?

    init(value: T) {
        self.value = value
    }
}
```

## Linked List

### Properties
`guard var` : 옵셔널 추출, `guard`를 통해 추출에 성공하면 다음 코드 블럭에서도 변수를 사용할 수 있게 해준다.
`while let` : `if let`을 반복적으로 사용할 수 있게 해주는 코드, nil이 아닐때 까지 동작한다.

```swift
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
}
```
### Append

```swift
func append(value: T) {
    let newNode: Node<T> = Node(value: value)
    if let lastNode = last  {
        newNode.previous = lastNode
        lastNode.next = newNode
    } else {
        head = newNode
    }
}
```

### Search

```swift
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
```

### Remove

```swift
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
```
