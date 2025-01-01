# Linked List
> 노드가 있고, 노드는 자신 다음으로 어떤 노드와 연결 되어 있는지, 필요에 따라서는 자신 이전의 노드가 무엇인지를 저장하는 자료구조 이다.

- head : 시작 노드
- tail : 끝 노드

# Operations Complexity
||Insert|Deletion|Search|
|---|---|---|---|
|Big-O|O(1)|O(n) (search)|O(n)|

삽입연산: tail을 알고 있으면, O(1)이 소요된다.

# Singly(단일) vs doubly(이중) Linked List

이중 연결 리스트는 이전 노드도 저장 하므로 단일 연결 리스트에 비해 더 많은 메모리 공간을 필요로 한다. 하지만, 현재 노드 k에서 이전 노드를 모른다면 k-1번의 연산을 필요로 하기 때문에 알고 있는 편이 좋다.

