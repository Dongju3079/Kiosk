//
//  FiveGuysDrinks.swift
//  Kiosk
//
//  Copyright (c) 2023 z-wook. All right reserved.
//

import Foundation

final class DrinkManager {
    
    var pickedMenus: [Menu] = []
    
    func orderDrinks() -> [Menu] {
        let drinkList: [Menu] = Drink.allCases.map {
            Menu($0.drinkName, $0.drinkPrice)
        }
        
        while true {
            printBurgersMenu(drinkList)
            guard let userInput = readLine(),
                  let userInput = Int(userInput) else {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            switch userInput {
            case 0:
                print("뒤로가기를 선택하셨습니다. \n")
                return pickedMenus
            case (1...drinkList.count):
                pickedMenus.append(drinkList[userInput - 1])
                print("\(drinkList[userInput - 1].name)를 주문하셨습니다. 가격은 \(drinkList[userInput - 1].price)000원 입니다. \n")
                continue
            default:
                print("올바른 메뉴를 입력해주세요. \n")
            }
        }
    }
}

private extension DrinkManager {
    func printBurgersMenu(_ burgersList: [Menu]) {
        print("[ Drinks MENU ]")
        for (index, burger) in burgersList.enumerated() {
            print("\(index + 1). \(burger.name) | W \(burger.price) |")
        }
        print("0. 뒤로가기\n")
    }
}
