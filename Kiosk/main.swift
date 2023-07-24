//
//  main.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//

import Foundation

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
        break
    case "4":
        orderSandwiches()
        break
    default:
        print("올바른 메뉴를 입력해주세요.")
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
