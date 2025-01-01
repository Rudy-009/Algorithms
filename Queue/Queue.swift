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

var queue: Queue<Int> = Queue() 

queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)

print(queue.front!)
print(queue.dequeue()!)
print(queue.dequeue()!)
print(queue.dequeue()!)
print(queue.isEmpty)