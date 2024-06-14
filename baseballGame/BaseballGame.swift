//
//  BaseballGame.swift
//  baseballGame
//
//  Created by 강유정 on 6/11/24.
//

struct BaseballGame {
    mutating func start() {
        var gameCount = 0
        var playCount = 0
        var massageArray:[String] = []

        // 안내문구 출력
        print("환영합니다! 원하시는 번호를 입력해주세요.")
        while true {
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            // 유저의 입력값을 받음
            let number = Int(readLine()!)!
            
            // 입력값에 따라 처리
            switch number {
            case 1:

                playCount = 0
                // 시도 횟수 초기화
                let _ = makeAnswer()
                // 게임을 시작하는 함수 불러오기
                gameCount += 1
                // 몇번째 게임인지 카운트
                
                massageArray.append(contentsOf: ["\(gameCount)번째 게임 : 시도 횟수 - \(playCount)"])
                // 게임 기록 저장

            case 2:
                print("< 게임 기록 보기 >")
              
                // 게임 기록 누적 프린트
                for i in 0..<massageArray.count {
                            print(massageArray[i])
                }
                continue
                
            case 3:
                print("< 숫자 야구 게임을 종료합니다 >")
                return
            default:
                print("올바른 숫자를 입력해주세요 !")
                break
            }
        }
        
        // 정답을 만들고, 확인하는 함수
        func makeAnswer() -> Int {
            
            let answer: String = ""
            var answerSet:Set<String> = []
            var answerArray = Array(answer)
            
            // 정답 만들기
            // 정답도 중복이 있으면 안되므로, set으로 랜덤 숫자 뽑기
            while answerSet.count < 3 {
                answerSet.update(with: String(Int.random(in: 0...9)))
            }
            
            // 배열에 넣어서 맨 앞이 0 이면 제거하고 추가하기
            for i in answerSet {
                answerArray += String(i)
                
                if answerArray[0] == "0" {
                    answerArray.removeFirst()
                    
                    answerArray.insert(contentsOf: String(Int.random(in: 1...9)), at: 0)
                }
            }
            
            // 추가된 배열이 중복이 아닌지 확인하고, 맨처음에 0이 안들어가도록 추가
            if answerArray[0] == answerArray[1] || answerArray[0] == answerArray[2] {
                answerArray.removeFirst()
                answerArray.insert(contentsOf: String(Int.random(in: 1...9)), at: 0)
            }
            
            // 정답 확인용
            print("정답: \(answerArray)")
            
            print("< 게임을 시작합니다 >")
            repeat {
                print("숫자를 입력하세요.")
                // 유저에게 입력값을 받음
                let input = readLine()!
                
                var inputSet:Set<String> = []
                let inputArray = Array(input)
                var strike = 0
                var ball = 0
                
                // 중복되지 않도록 하기 위해 input값을 Set에 미리 담아두기
                for i in 0..<input.count {
                    inputSet.update(with: String(inputArray[i])) }
                
                // 정수로 변환되지 않는 경우 반복문 처음으로 돌아가고 에러 출력
                guard let _ : Int = Int(input) else {print("Eror: 올바르지 않은 입력값입니다. (정수 외 입력 불가)"); continue }
                
                // 정답이라면 종료
                if inputArray == answerArray {
                    print("정답입니다 !")
                    print("< 종료 >")
            
                    playCount += 1
                    // 몇번째 게임인지 카운트하기 위해 +1
                    break
                    
                // 세자리가 아니거나, 특정 숫자가 두번 사용되거나, 맨 처음 숫자가 0인 경우 에러 출력
                } else if input.count != 3 {
                    print("Eror: 올바르지 않은 입력값입니다. (3자리수 외 입력 불가)")
                    
                } else if inputSet.count != 3 {
                    print("Eror: 올바르지 않은 입력값입니다. (중복 불가)")
                    
                } else if (inputArray[0] == "0") {
                    print("Eror: 올바르지 않은 입력값입니다. (3자리수 외 입력 불가)")
                    
                } else {
                    // 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
                    for i in 0...2 {
                        if inputArray[i] == answerArray[i] {
                            strike += 1
                        } else {
                            if inputArray.contains(answerArray[i]) {
                                ball += 1
                            }
                        }
                        
                    }
                    ; print("\(strike)스트라이크 \(ball)볼")
                }
                playCount += 1
                // 시도한 횟수를 보기 위해 카운트
                
            } while true
            
            return playCount
        }
        
    }
    
}





