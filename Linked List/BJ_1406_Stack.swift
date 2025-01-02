import Foundation

// 입력
var input = Array(readLine()!)
var commandsCount = Int(readLine()!)!

var leftStack = input
var rightStack: [Character] = []

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

print(String(leftStack + rightStack.reversed()))
