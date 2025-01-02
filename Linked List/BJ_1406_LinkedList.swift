
// https://www.acmicpc.net/problem/1406

let editor: LinkedList<Character> = LinkedList<Character>()

var string = readLine()!
var count = Int(readLine()!)!

// 입력 받은 문자열을 문자 단위로 연결 리스트에 저장한다.
// string to character
let charArr = Array(string)
for char in charArr {
    editor.append(value: char)
}
// cursor를 last node로 저장한다.
editor.cursor = editor.last

for _ in 1...count {
    let command = readLine()!.split(separator: " ")

    switch command[0] { // cursor가 nil인 경우, 문장의 맨 앞이라는 뜻.
        case "L":
            editor.moveCursorLeft()
        case "D":
            editor.moveCursorRight()
        case "B":
            editor.deleteCharacter()
            // nil인 경우, 문장의 맨 앞, 동작 X
        case "P":
            editor.inputCharactor(value: command[1].first!)
            
        default:
            print("Exception")
    }
}

editor.toString()

//MARK: Cursor Methods
extension LinkedList {
    // L: 커서를 왼쪽으로 한 칸 옮김 (커서가 문장의 맨 앞이면 무시됨)
    func moveCursorLeft() {
        if let cursor = cursor { // 맨 앞이 아닌 경우
            self.cursor = cursor.previous
        }
    }

    // D: 커서를 오른쪽으로 한 칸 옮김 (커서가 문장의 맨 뒤이면 무시됨)
    func moveCursorRight() {
        if let cursor = cursor, let next = cursor.next { // 맨 앞 X, 다음도 있는 경우
            self.cursor = next
        } else if cursor == nil, head != nil { // 문장 맨 앞 + head가 있는 경우
            self.cursor = head
        }
    }

    // B: 커서 왼쪽에 있는 문자를 삭제함 (커서가 문장의 맨 앞이면 무시됨) 삭제로 인해 커서는 한 칸 왼쪽으로 이동한 것처럼 나타나지만, 실제로 커서의 오른쪽에 있던 문자는 그대로임
    func deleteCharacter() {
        if let cursor = cursor, !isEmpty {
            _ = remove(node: cursor)
            //toString()
        } // 비어있거나, 맨 앞이면 동작 X
    }

    // P $: $라는 문자를 커서 왼쪽에 추가함
    func inputCharactor(value: T) {
        let newNode: Node<T> = Node(value: value)

        if isEmpty { // 비어있는 경우
            head = newNode
            cursor = head
        } else { // 노드가 있는 경우
            if let cursor = cursor { // cursor가 문장 중간 혹은 마지막에 있는 경우
                if let nextNode = cursor.next {  // cursor가 tail이 아닌 경우
                    newNode.next = nextNode
                    nextNode.previous = newNode
                }
                cursor.next = newNode
                newNode.previous = cursor
            } else { // cursor가 문장 맨 앞에 있는 경우
                newNode.next = head
                head!.previous = newNode
                head = newNode
                cursor = head
            }
        }
    }

    func toString() {
        if var node = first {
            print("\(node.value)", terminator: "")
            while let next = node.next {
                print("\(next.value)", terminator: "")
                node = next
            }
        }
        print()
    }
}

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
    var cursor: Node<T>? // 해당 노드의 우측에 있거나, head 왼쪽 = nil

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