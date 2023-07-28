//
//  payment.swift
//  Kiosk
//
//  Created by Macbook on 2023/07/26.
//
//

import Foundation

// MARK: - 장바구니

func compareTime() -> Bool {
    let calendar = Calendar.current
    let now = Date()
    let components = calendar.dateComponents([.hour, .minute], from: now)
    if let hour = components.hour, let minute = components.minute {
        // 현재 시간이 오후 11시부터 11시 30분 사이인지 확인
        if hour == 21 && minute >= 30 && minute <= 59 { return true }
    }
    return false
}

class Payment {
    let orderManager = OrderManager()
    var loop = true
    lazy var mainAmount = UserInfo.poket.reduce(0) { $0 + $1.price }
    
    deinit  {
        print("5초 뒤 메인화면으로 돌아갑니다.")
        sleep(5)
    }
}

extension Payment {
    // 장바구니 사이클
    func basket(userInfo: UserInfo) {
        printList()
        
        while true {
            guard UserInfo.poket.isEmpty != true else {
//                print("장바구니가 비었습니다.")
                loop.toggle()
                return
            }
        
            print("""
            소요 금액 : \((mainAmount * 1000))
            1. 장바구니 수정 \n2. 결재 \n3. 메인메뉴
            """)
         
            let text = readLine()
            switch text {
            case "1":
                editBasket(user: userInfo)
            case "2":
                if !compareTime() {
                    payment(user: userInfo)
                    
                } else { print("❗️현재 은행 점검 시간입니다.") }
            case "3":
                loop.toggle()
                return
            default:
                print("올바른 메뉴를 입력해주세요. \n")
            }
        }
    }
    
    // 항목 프린트
    func printList() {
        print("장바구니 항목")
        for food in UserInfo.poket {
            print("\(food.name) | W \(food.price) |")
        }
    }
    
    // 장바구니 체크
    func checkBasket() {
        guard UserInfo.poket.isEmpty != true else {
            print("장바구니가 비었습니다.")
            loop.toggle()
            return
        }
    }
    
    // 장바구니 수정
    func editBasket(user: UserInfo) {
        while true {
            guard UserInfo.poket.isEmpty != true else {
                print("장바구니가 비었습니다.")
                return
            }
            
            orderManager.printPickedMenu(pickMenus: UserInfo.poket)
            guard let text = readLine(),
                  let index = Int(text) else { continue }
            switch index {
            case 0:
                return
            case 1...UserInfo.poket.count:
                mainAmount -= UserInfo.poket[index - 1].price
                user.removePoket(index: index - 1)
            default: print("올바른 메뉴를 입력해주세요. \n")
            }
        }
    }
    
    // 결재하기
    func payment(user: UserInfo) {
        if user.money > mainAmount {
            user.money -= mainAmount
            print("결재가 완료됐습니다.")
            PrintReceipt().printReceipt(payItem: UserInfo.poket, remainMoney: (user.money * 1000))
            user.emptyPoket()
            loop.toggle()
            return
        } else {
            print("\((mainAmount - user.money) * 1000)원이 부족합니다, 장바구니를 비워주세요.")
        }
    }
}

