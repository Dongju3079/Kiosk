//
//  main.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//

import Foundation


func aaa() {
    print("장바구니 출력")
}


func printer() {
    DispatchQueue.global().asyncAfter(wallDeadline: .now() + 5) {
        aaa()
        printer()
    }
}

func compareTime() -> Bool {
    let calendar = Calendar.current
    let now = Date()
    
    let components = calendar.dateComponents([.hour, .minute], from: now)
    if let hour = components.hour, let minute = components.minute {
        // 현재 시간이 오후 11시부터 11시 30분 사이인지 확인
        if hour == 23 && minute >= 0 && minute <= 30 { return true }
    }
    return false
}

let closure: () -> Void = {
    print("~~~~~~~~ 3초 대기 ~~~~~~~~")
    sleep(3)
}

func mainMenu() {
    printer()
    
    while true {
        printHomeKiosk()
        
        let userInput = readLine()
                
        switch userInput {
        case "0":
            print("프로그램을 종료합니다.")
            exit(0)
        case "1":
            orderBurders()
            break
        case "2":
            break
        case "3":
            OrderManager().orderDrinks(type: .drink, userInfo: UserInfo(), completion: closure)
            break
        case "4":
            OrderManager().orderDrinks(type: .shake, userInfo: UserInfo(), completion: closure)
            break
        default:
            print("올바른 메뉴를 입력해주세요.")
        }
    }
}

func printHomeKiosk() {
    print("""
    🖥️ 아래 메뉴판을 보시고 메뉴를 골라 입력해주세요. 🖥️

    [ FIVE JAYS MENU ]
    1. Burgers         | 비프 통살을 다져만든 버거
    2. Hotdog          | 매장에서 신선하게 만드는 핫도그
    3. Drinks          | 매장에서 직접 만드는 음료
    4. Sandwiches      | 엄마손 샌드위치
    0. 종료             | 프로그램 종료
    
    """)
}

mainMenu()
