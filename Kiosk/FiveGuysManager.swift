//
//  FiveGuysManager.swift
//  Kiosk
//
//  Copyright (c) 2023 z-wook. All right reserved.
//

import Foundation

final class UserInfo {
    var pickMenu: [Menu] = []
    
    func updateMenu(data: Menu) {}
    
    func removeMenu(data: Menu) {}
}

final class OrderManager {
    func orderDrinks(type: Product, userInfo: UserInfo) {
        var drinkList: [Menu] = []
        
        for i in type.productName.indices {
            drinkList.append(Menu(type.productName[i], type.productPrice[i]))
        }
        
        while true {
            printDrinksMenu(type: type, drinkList, pickMenus: userInfo.pickMenu)
            
            guard let userInput = readLine(),
                  let userInput = Int(userInput) else {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            
            if userInfo.pickMenu.isEmpty && userInput == drinkList.count + 1 {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            
            switch userInput {
            case 0:
                print("뒤로가기를 선택하셨습니다. \n")
                return
            case (1...drinkList.count):
//                print("type.name : \(type.name)")
//                print("type : \(type)")
                
                if type.name == "감자튀김" {
                    
                    var selectSize: Bool = true
                    
                    while selectSize {
                        
                        var sizeList: [Menu] = []
                        
                        for i in Product.sizeup.productName.indices {
                            sizeList.append(Menu(Product.sizeup.productName[i], Product.sizeup.productPrice[i]))
                        }
                        
                        print("[ \(Product.sizeup.name) ]")
                        for (index, size) in sizeList.enumerated() {
                            print("\(index + 1). \(size.name) | + W \(size.price) |")
                        }
                        print("0. 뒤로가기\n")
                        
                        guard let sizeInput = readLine(),
                              let sizeInput = Int(sizeInput) else {
                            print("올바른 메뉴를 입력해주세요. \n")
                            continue
                        }
                        
                        if userInfo.pickMenu.isEmpty && userInput == sizeList.count + 1 {
                            print("올바른 메뉴를 입력해주세요. \n")
                            continue
                        }
                        
                        switch sizeInput {
                        case 0:
                            print("뒤로가기를 선택하셨습니다. \n")
                            return
                        case (1...sizeList.count):
                            print("\(sizeInput)을 선택하셨습니다. \n")
                            
                            var sizeupList: [Menu] = []
                            
                            var menuSizeName: String
                            var menuSizePrice: Double
                            
                            menuSizeName = type.productName[userInput - 1] + " \(sizeList[sizeInput - 1].name)"
                            menuSizePrice = type.productPrice[userInput - 1] + sizeList[sizeInput - 1].price
                            
                            sizeupList.append(Menu(menuSizeName, menuSizePrice))
                            
                            // 사용자
//                            userInfo.updateMenu(data: sizeupList[userInput - 1])
                            print("---------- test ----------")
                            print("\(sizeupList[sizeupList.count - 1].name)를 주문하셨습니다. 가격은 \(sizeupList[sizeupList.count - 1].price)000원 입니다. \n")
                            
                            selectSize = false
                            continue
                            
                        default:
                            print("올바른 메뉴를 입력해주세요. \n")
                        }
                    }
                } else {
                    userInfo.updateMenu(data: drinkList[userInput - 1])
                    print("\(drinkList[userInput - 1].name)를 주문하셨습니다. 가격은 \(drinkList[userInput - 1].price)000원 입니다. \n")
                    continue
                }
                
            case (drinkList.count + 1): // 삭제
                printPickedMenu(pickMenus: userInfo.pickMenu)
                guard let userInput = readLine(),
                      let userInput = Int(userInput) else {
                    print("올바른 메뉴를 입력해주세요. \n")
                    continue
                }
                if userInput == 0 { break }
                userInfo.removeMenu(data: userInfo.pickMenu[userInput - 1])
                continue
            default:
                print("올바른 메뉴를 입력해주세요. \n")
            }
        }
    }
    
    func sizeCheck() {
        
    }
}

private extension OrderManager {
    func printDrinksMenu(type: Product, _ drinkList: [Menu], pickMenus: [Menu]) {
        print("[ \(type.name) MENU ]")
        for (index, drink) in drinkList.enumerated() {
            print("\(index + 1). \(drink.name) | W \(drink.price) |")
        }
        if !pickMenus.isEmpty {
            print("====================================")
            print("\(drinkList.count + 1). 메뉴 취소")
        }
        print("0. 뒤로가기\n")
    }
    
    func printPickedMenu(pickMenus: [Menu]) {
        print("취소할 식품을 선택해주세요.")
        for (index, drink) in pickMenus.enumerated() {
            print("\(index + 1). \(drink.name)")
        }
        print("0. 뒤로가기\n")
    }
}
