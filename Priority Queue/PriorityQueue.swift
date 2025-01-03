public struct PriorityQueue<T> {
  fileprivate var heap: Heap<T>

  public init(elements: [T], priorityFunction: @escaping (T, T) -> Bool) {
    heap = Heap(elements: elements, priorityFunction: priorityFunction)
  }

  public var isEmpty: Bool {
    return heap.isEmpty
  }

  public var count: Int {
    return heap.count
  }

  public func peek() -> T? {
    return heap.peek()
  }

  public mutating func enqueue(element: T) {
    heap.enqueue(element)
  }

  public mutating func dequeue() -> T? {
    return heap.dequeue()
  }

}

var pq = PriorityQueue<Int>(elements: [10,20,30,40], priorityFunction: >)
pq.enqueue(element: 25)
print(pq.peek()!)

struct Heap<T> {
    private var elements = [T]()
    let priorityFunction : (T, T) -> Bool

    var isEmpty : Bool {
        return elements.isEmpty
    }

    var count : Int {
        return elements.count
    }

    init(elements: [T] = [], priorityFunction: @escaping (T, T) -> Bool) { // 1 // 2
        self.elements = elements
        self.priorityFunction = priorityFunction // 3
        buildHeap() // 4
    }

    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() { // 5
            siftDown(elementAtIndex: index) // 6
        }
    }

    func peek() -> T? {
        return elements.first
    }

    func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }

    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }

    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }

    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }

    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
            else { return parentIndex }
        return childIndex
    }
	
    func highestPriorityIndex(for parent: Int) -> Int { // 부모와 바로 아래에 있는 자식들 중에 누가 우선순위가 더 높은지 비교
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }

    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
            else { return }
        let temp = elements[firstIndex]
        elements[firstIndex] = elements[secondIndex]
        elements[secondIndex] = temp
    }

    mutating func enqueue(_ element: T) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }

    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
            isHigherPriority(at: index, than: parent)
            else { return }
        swapElement(at: index, with: parent) 
        siftUp(elementAtIndex: parent) 
    }

    mutating func dequeue() -> T? {
        guard !isEmpty 
            else { return nil }
        swapElement(at: 0, with: count - 1) 
        let element = elements.removeLast() 
        if !isEmpty { 
            siftDown(elementAtIndex: 0) 
        }
        return element 
    }

    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index) // 1
        if index == childIndex { // 2
            return
        }
        swapElement(at: index, with: childIndex) // 3
        siftDown(elementAtIndex: childIndex)
    }
}