struct Stack<T> {
    private var data = [T]()

    var count: Int {
        return data.count
    }

    var top: T? {
        return data.last
    }

    var isEmpty: Bool {
        return data.isEmpty
    }

    mutating func push(_ element: T) {
        data.append(element)
    }

    mutating func pop() -> T? {
        data.popLast()
    }
}

var stack: Stack<Int> = Stack() 

stack.push(10)
stack.push(20)
stack.push(30)

// stack.top() 30
// stack.pop() 30
// stack.pop() 20
// stack.pop() 10
// stack.isEmpty true
