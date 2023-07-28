//
//  sandwiches.swift
//  Kiosk
//
//  Created by t2023-m0047 on 2023/07/24.
//

import Foundation

func orderSandwiches() {
    var shoppingCart: [Sandwiches] = []
    
    let sandwichesList: [Sandwiches] = [ // level 3에서는 모든 메뉴 통합
        Sandwiches("Veggie Sandwich", 9.9),
        Sandwiches("Cheese Veggie Sandwich", 11.4),
        Sandwiches("Grilled Cheese Sandwich", 8.4),
        Sandwiches("BLT Sandwich", 10.9),
    ]
    
    while true {
        printSandwichesMenu(sandwichesList)
        
        guard let userInput = readLine() else {
            continue
        }
        
        guard let inputNumber = Int(userInput) else {
            continue
        }
        
        switch inputNumber {
            case 0:
              print("뒤로가기를 선택하셨습니다. \n")
              return
          case 1, 2, 3, 4:
              print("\(sandwichesList[inputNumber - 1].name)를 주문하셨습니다. 가격은 \(sandwichesList[inputNumber - 1].price)000원 입니다. \n")
          var pickSandwich = sandwichesList[inputNumber - 1]
            
            shoppingCart.append(pickSandwich)
            
            
          default:
              print("올바른 메뉴를 입력해주세요. \n")
          }
    }
}

func printSandwichesMenu(_ sandwichesList: [Sandwiches]) {
    print("[ Sandwiches MENU ]")
    for (index, sandwich) in sandwichesList.enumerated() {
        print("\(index + 1). \(sandwich.name)  | W \(sandwich.price)")
    }
    print("0. 뒤로가기\n")
}
