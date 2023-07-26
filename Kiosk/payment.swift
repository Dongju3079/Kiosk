//
//  payment.swift
//  Kiosk
//
//  Created by Macbook on 2023/07/26.
//

import Foundation

class Payment {
    
    let orderManager = OrderManager()
    
    var loop = true
    
    func pay(userInfo: UserInfo) {
        // 결재 or 장바구니 제거 or 돌아가기
        
     OUTER: while loop {
         
            var amount = UserInfo.poket.reduce(0) { $0 + $1.price }
            
            print("1. 결재 \n2. 장바구니 \n3. 메인메뉴")
            
            let text = readLine()
            
            switch text {
            case "1":
                pay(userInfo: userInfo, amount: amount)
//                guard UserInfo.poket.isEmpty != true else {
//                    print("장바구니가 비었습니다.")
//                    return
//                }
//                if userInfo.money > amount {
//                    userInfo.money -= amount
//                    print("결재가 완료됐습니다.")
//                    print("잔액 \(floor(userInfo.money * 1000))")
//                    userInfo.emptyPoket()
//                    return
//                } else { print("\(floor(amount - userInfo.money) * 1000)원이 부족합니다, 장바구니를 비워주세요.")
//                    continue
//                }
            case "2":
                guard UserInfo.poket.isEmpty != true else {
                    print("장바구니가 비었습니다.")
                    return
                }
                
                while true {
                print("장바구니 항목")
                for food in UserInfo.poket {
                    print("\(food.name) | W \(food.price) |")
                }
                print("결제 금액 :\(floor(amount * 1000))")
                print("\n1. 장바구니에서 제거하기 \n2. 결재하기 \n3. 메인화면으로 돌아가기")
                let text = readLine()
                switch text {
                case "1":
                INTER: while true {
                    orderManager.printPickedMenu(pickMenus: UserInfo.poket)
                    print("결제 금액 :\(floor(amount * 1000))")
                    
                        guard let text = readLine(),
                              let index = Int(text) else { continue }
                        switch index {
                        case 1...UserInfo.poket.count:
                            userInfo.removePoket(index: index - 1)
                            amount -= UserInfo.poket[index - 1].price
                            continue
                        case 0:
                            break INTER
                        default: print("올바른 메뉴를 입력해주세요. \n")
                        }
                    }
                case "2":
                    guard UserInfo.poket.isEmpty != true else {
                        print("장바구니가 비었습니다.")
                        return
                    }
                    if userInfo.money > amount {
                        userInfo.money -= amount
                        print("결재가 완료됐습니다.")
                        print("잔액 \(floor(userInfo.money * 1000))")
                        userInfo.emptyPoket()
                        return
                    } else {
                        print("돈부족해")
                        continue
                    }
                case "3":
                    break OUTER
                default:
                    continue
                }
            }
            case "3":
                return
                // 삭제 and 결재
            default: print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
        }
        
    }
    
    func pay(userInfo: UserInfo, amount: Double) {
            guard UserInfo.poket.isEmpty != true else {
                print("장바구니가 비었습니다.")
                loop = false
                return
            }
            if userInfo.money > amount {
                userInfo.money -= amount
                print("결재가 완료됐습니다.")
                print("잔액 \(floor(userInfo.money * 1000))")
                userInfo.emptyPoket()
                return
            } else { print("\(floor(amount - userInfo.money) * 1000)원이 부족합니다, 장바구니를 비워주세요.")
                return
            }
    }
}
