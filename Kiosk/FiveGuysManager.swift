//
//  FiveGuysManager.swift
//  Kiosk
//
//  Copyright (c) 2023 z-wook. All right reserved.
//

import Foundation
// MARK: - 메뉴선택
final class OrderManager {

    func orderFoods(foods: [Food], type: Product, userInfo: UserInfo) {
        
        while true {
            printFoodsMenu(type: type, foodList: foods)
            guard let userInput = readLine(),
                  let userInput = Int(userInput) else {
                print("올바른 메뉴를 입력해주세요. 가드 \n")
                continue
            }
            
            if UserInfo.poket.isEmpty && userInput == foods.count + 1 {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            
            switch userInput {
            case 0:
                print("뒤로가기를 선택하셨습니다. \n")
                return
            case (1...foods.count):
                userInfo.updatePoket(food: foods[userInput - 1])
                //print("\(drinkList[userInput - 1].name)를 주문하셨습니다. 가격은 \(drinkList[userInput - 1].price)000원 입니다. \n")
                print("\(foods[userInput - 1].name)가 장바구니에 담겼습니다. \n")
                continue
                
            case foods.count + 1: // 삭제
                
          INTER:while true {
                printPickedMenu(pickMenus: UserInfo.poket)
                
                guard UserInfo.poket.isEmpty != true else {
                    print("장바구니가 비었습니다.")
                    break INTER
                }
                
                guard let userInput = readLine(),
                      let userInput = Int(userInput) else { continue }
                
                switch userInput {
                case 1...UserInfo.poket.count:
                    userInfo.removePoket(index: userInput - 1)
                case 0:
                    break INTER
                default: print("올바른 메뉴를 입력해주세요. \n")
                }
            }
                
            default:
                print("올바른 메뉴를 입력해주세요. \n")
            }
        }
    }
}

extension OrderManager {
    func printFoodsMenu(type: Product, foodList: [Food]) {
    
        print("[ \(type.name) MENU ]")
        for i in 0..<foodList.count {
            print("\(i + 1). \(foodList[i].name) | W \(foodList[i].price) |")
        }
        if !foodList.isEmpty {
            print("\(foodList.count + 1). 메뉴 취소")
        }
        print("0. 뒤로가기\n")
    }
    
    func printPickedMenu(pickMenus: [Food]) {
        print("취소할 식품을 선택해주세요.")
        for i in 0..<pickMenus.count {
            print("\(i + 1). \(pickMenus[i].name) | W \(pickMenus[i].price) |")
        }
        print("0. 뒤로가기\n")
    }
}
