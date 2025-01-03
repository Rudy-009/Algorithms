# Priority Queue
> head가 queue 내에서 가장 크거나 작은 값인 queue


## 사용
- Dijkstra's Algorithm
- Event-driven
- Huffman Encoding

## 구현
- array: 추가할 때 마다, 정렬을 해주어야 함. O(n*log n)
- heap : 모든 연산에서 O(log n)이 걸린다. (주로 많이 씀)
- binary search tree : 양 끝이, min max인 double-ended priority queue를 구현하기 매우 적합하다.

