# Queue

||Enqueue|Dequeue|
|---|---|---|
|Big-O|O(1)|O(n)|

Queue의 Dequeue 연산이 O(n)인 이유는 0번째 인덱스를 삭제 한 후 다음 요소들을 복사하여 앞의 인덱스의 값으로 붙여 넣는 연산을 n - 1번 하기 때문에 O(n) 이다.
하지만 공간 복잡도를 늘리는 대신 시간 복잡도를 O(1)로 줄일 수 있는 방법이 있다. 이는 코딩 테스트에서 조금이라도 연산 시간을 줄이기 위함이다.

AdvancedQueue.swift 는 Dequeue연산 이후, first의 요소를 삭제하는 대신 first를 가리키는 인덱스를 다음 요소로 움직이며 연산 시간을 1로 줄이는 작업이다.

head : 첫 번째 인덱스를 가리킴
last : 마지막 인덱스를 가리킴

last - head
== 0 : empty
\> 0 : not empty
