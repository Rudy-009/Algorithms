struct Queue<T> {
    private var data = [T]() 

    var count: Int {
        return data.count
    }

    var front: T? {
        return data.first
    }

    var isEmpty: Bool {
        return data.isEmpty
    }

    mutating func enqueue(_ element: T) {
        data.append(element)
    }

    mutating func dequeue() -> T? {
        if !isEmpty {
            return data.removeFirst()
        } else {
            return nil
        }
    }
}