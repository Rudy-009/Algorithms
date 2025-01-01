# Queue

> Queue는 FIFO(First In, First Out) 원칙을 따르는 자료구조로, 가장 먼저 추가된 데이터가 가장 먼저 처리된다. 주로 데이터 처리 순서를 유지하거나 작업 대기열을 관리하는 데 사용한다.

# Array Based Queue's Operation Complexity
||Enqueue|Dequeue|
|---|---|---|
|Big-O|O(1)|O(n)|

배열 기반 Queue에서 dequeue() 연산은 배열의 첫 번째 요소를 제거한 후, 나머지 요소들을 앞으로 이동시키는 복사 연산이 필요하다. 이 과정에서 n−1번의 연산이 발생하므로 시간 복잡도는 O(n)이다.

## Optimization Methods
### 1. Linked List
    - 장점: Dequeue 연산의 시간 복잡도는 O(1)로 줄일 수 있다.
    - 단점:
### 2. Two-Pointer Approach
    - head, tail이라는 인덱스를 이용하여 배열 내의 삭제연산 없이 인덱스의 값 변화(O(1))만으로 Dequeue 연산을 구현하는 방법.
    - head : 첫 번째 인덱스를 가리킴
    - tail : 마지막 인덱스를 가리킴
    - Queue가 비어있는지 확인하는 조건 : 
       tail - head == 0 : empty
       tail - head \> 0 : not empty
    - 메모리 최적화 추가 :
        - 조건 1. head 앞에 50개의 데이터가 있고,
        - 조건 2. head 50보다 적은 요소가 있을 때,
        - removeFirst(50)을 호출하여 head앞의 50개의 데이터를 제거하고 tail =- head, head = 0

## Implementaion

### Basic Queue Implementation
```swift
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
```

### Optimized Queue with Two-Pointer
```swift
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
            let frontElement = data[head]
            head += 1

            if head > 50 && head * 2 > data.count {
                data.removeFirst(head) // 50개의 
                tail -= head
                head = 0
            }

            return frontElement
        } else {
            return nil
        }
    }
}
```

### Example Usage
```swift
var queue = Queue<Int>()

queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)

print(queue.front!) // Output: 10

print(queue.dequeue()!) // Output: 10
print(queue.dequeue()!) // Output: 20

print(queue.isEmpty) // Output: false

print(queue.isEmpty) // Output: true
```