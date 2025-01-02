import Foundation

// 입력 받기
var input = Array(readLine()!) // 초기 문자열을 배열로 변환
var commandsCount = Int(readLine()!)! // 명령어 개수

// 스택 두 개 초기화
var leftStack = input // 초기 문자열은 왼쪽 스택에 저장
var rightStack: [Character] = []

// 명령어 처리
for _ in 0..<commandsCount {
    let command = readLine()!.split(separator: " ")
    
    switch command[0] {
    case "L": // 커서를 왼쪽으로 이동
        if !leftStack.isEmpty {
            rightStack.append(leftStack.removeLast())
        }
    case "D": // 커서를 오른쪽으로 이동
        if !rightStack.isEmpty {
            leftStack.append(rightStack.removeLast())
        }
    case "B": // 커서 왼쪽 문자 삭제
        if !leftStack.isEmpty {
            leftStack.removeLast()
        }
    case "P": // 커서 왼쪽에 문자 추가
        if let char = command[1].first {
            leftStack.append(char)
        }
    default:
        break
    }
}

// 결과 출력 (왼쪽 스택 + 오른쪽 스택 역순)
print(String(leftStack + rightStack.reversed()))
