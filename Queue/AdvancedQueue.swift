struct Queue<T> {
    private var data = [T]() 
    private var head = 0
    private var tail = 0

    var count: Int {
        return data.count
    }

    var front: T? {
        return data[head]
    }

    var isEmpty: Bool {
        return tail - head == 0 
    }

    mutating func enqueue(_ element: T) {
        data.append(element)
        tail += 1
    }

    mutating func dequeue() -> T? {
        if !isEmpty {
            let front = data[head]
            head += 1
            return front
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