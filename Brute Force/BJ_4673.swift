// 입력 X
// 출력 10000보다 작거나 같은 셀프 넘버를 한 줄에 하나씩 출력하는 프로그램을 작성하시오.

// 양의 정수 n에 대해서 d(n)을 n과 n의 각 자리수를 더하는 함수라고 정의하자.
// n + n의 첫 번째 자리 + n의 두 번째 자리 + ... + n의 k번째 자리

// 생성자란?
// n을 d(n)의 생성자라고 한다.

// 셀프 넘버란? 
// 생성자가 없는 숫자
// 100보다 작은 셀프 넘버 (1, 3, 5, 7, 9, 20, 31, 42, 53, 64, 75, 86, 97)

// 방법 1. 함수화
// 10000 까지의 생성자가 없는 숫자임을 어떻게 증명할 것인가? (연역)

// 방법 2. 출력을 보고 유추
// 1의 자리는 +2씩, 그 이후는 +11씩 하면 나온다 (귀납)
// 뒤의 숫자 9925 - 75는 11배수가 아니므로 중간에 다른 규칙이 있음을 알 수 있다.

let max = 10001

var array: [Bool] = Array(repeating: true, count: max) // 반드시 기억해야하는 함수

// 방법 1.1. 함수화 (셀프 넘버가 아닌 숫자들만 찾아내기)
// 식 : a x 1001 + b x 101 + c x 11 + d x 2 로 조합이 불가능한 숫자가 셀프 넘버
// 전부 계산 : Brute Force, a (0...9) b(0...9) c(0...9) d(1...9), O(10000)

func solution1() {
    for a: Int in 0...9 {
        for b: Int in 0...9 {
            for c: Int in 0...9 {
                for d: Int in 0...9 {
                    let index = a*1001 + b*101 + c*11 + d*2 // 최댓값이 배열의 길이를 넘을 수 있음
                    if index < max {
                        array[a*1001 + b*101 + c*11 + d*2] = false
                    }
                }   
            }
        }
    }
}

// 블로그
// 가능한 모든 생성자 수를 만들어서 정렬되게 저장한다. (문제를 읽고 바로 생각난 직관적인 풀이)

func solution2() {
    for n in 1...10000 {
        let i = d(n: n)
        if i < max {
            array[i] = false
        }
    }
}

func d(n: Int) -> Int {
    var provider = n
    var sum: Int = provider

    while(provider != 0) {
        sum += provider % 10
        provider = provider / 10
    }

    return sum
}

solution2()

for index in 1...(max-1) {
    if array[index] {
        print(index)
    }
}