//
//  FiveGuysDrinks.swift
//  Kiosk
//
//  Copyright (c) 2023 z-wook. All right reserved.
//

import Foundation

final class DrinkManager {
    
    var pickedMenus: [Menu] = PickMenus.pickedMenus
    
    func orderDrinks() -> [Menu] {
        let drinkList: [Menu] = Drink.allCases.map {
            Menu($0.drinkName, $0.drinkPrice)
        }
        
        while true {
            print("pickMenu: \(pickedMenus)")
            
            printDrinksMenu(drinkList)
            
            guard let userInput = readLine(),
                  let userInput = Int(userInput) else {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            
            if pickedMenus.isEmpty && userInput == drinkList.count + 1 {
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
            case (drinkList.count + 1): // 삭제
                printPickedMenu()
                guard let userInput = readLine(),
                      let userInput = Int(userInput) else {
                    print("올바른 메뉴를 입력해주세요. \n")
                    continue
                }
                if userInput == 0 { break }
                pickedMenus.remove(at: userInput - 1)
                continue
            default:
                print("올바른 메뉴를 입력해주세요. \n")
            }
        }
    }
}

private extension DrinkManager {
    func printDrinksMenu(_ drinkList: [Menu]) {
        print("[ Drinks MENU ]")
        for (index, drink) in drinkList.enumerated() {
            print("\(index + 1). \(drink.name) | W \(drink.price) |")
        }
        if !pickedMenus.isEmpty {
            print("====================================")
            print("\(drinkList.count + 1). 메뉴 취소")
        }
        print("0. 뒤로가기\n")
    }
    
    func printPickedMenu() {
        print("취소할 음료를 선택해주세요.")
        for (index, drink) in pickedMenus.enumerated() {
            print("\(index + 1). \(drink.name)")
        }
        print("0. 뒤로가기\n")
    }
}
