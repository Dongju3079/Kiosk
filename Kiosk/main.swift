//
//  main.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//

import Foundation

while true {
    printHomeKiosk()
    print("🖥️ 메뉴를 입력하세요: ", terminator: "")
    let userInput = readLine()
            
    switch userInput {
    case "0":
        print("프로그램을 종료합니다.")
        exit(0)
    case "1":
        OrderManager().orderDrinks(type: .burger, userInfo: UserInfo())
        break
    case "2":
        break
    case "3":
        OrderManager().orderDrinks(type: .drink, userInfo: UserInfo())
        break
    case "4":
        OrderManager().orderDrinks(type: .shake, userInfo: UserInfo())
        break
    default:
        print("‼️ 숫자로 입력하세요")
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
