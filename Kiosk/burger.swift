//
//  burger.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//

import Foundation

func orderBurders() {
    let burgersList: [Burger] = [ // level 3에서는 모든 메뉴 통합
        Burger("Hamburger", 13.4),
        Burger("Cheeseburger", 14.9),
        Burger("Bacon Burger", 15.9),
        Burger("Bacon Cheeseburger", 17.4),
    ]
    
    while true {
        printBurgersMenu(burgersList)
        
        let userInput = readLine()
        
        switch userInput {
            case "0":
              print("뒤로가기를 선택하셨습니다. \n")
              return
          case "1", "2", "3", "4":
              print("\(burgersList[Int(userInput!)! - 1].name)를 주문하셨습니다. 가격은 \(burgersList[Int(userInput!)! - 1].price)000원 입니다. \n")
          default:
              print("올바른 메뉴를 입력해주세요. \n")
          }
    }
}

func printBurgersMenu(_ burgersList: [Burger]) {
    print("[ Burgers MENU ]")
    for (index, burger) in burgersList.enumerated() {
        print("\(index + 1). \(burger.name)  | W \(burger.price)")
    }
    print("0. 뒤로가기\n")
}
