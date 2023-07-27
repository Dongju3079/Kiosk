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
        print("🖥️ 메뉴를 입력하세요: ", terminator: "")
        let userInput = readLine()
                
        switch userInput {
        case "0":
            print("프로그램을 종료합니다.")
            exit(0)
        case "1":
            OrderManager().orderDrinks(type: .burger, userInfo: UserInfo(), completion: closure)
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
            print("‼️ 숫자로 입력하세요")
        }
    }
}

func printHomeKiosk() {
    print("""
    
    *---------------------*
    |   FIVE JAYS  MENU   |
    *_____________________*
    |  1. Burgers     🍔  |
    |  2. Hotdog      🌭  |
    |  3. Drinks      🥤  |
    |  4. Sandwiches  🥪  |
    |  0. Exit        👋🏼  |
    -----------------------
    """)
}

mainMenu()
