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
                // 감자 튀김인 경우 size를 선택해야 함으로
                if type.name == "감자튀김" || type.name == "버거" {
                    sizeCheck(type: type, userInfo: userInfo, userInput: userInput)
                } else {
                    userInfo.updateMenu(data: drinkList[userInput - 1])
                    print("\(drinkList[userInput - 1].name)를 주문하셨습니다. 가격은 \(Int(drinkList[userInput - 1].price * 1000))원 입니다. \n")
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
    
    // 감자튀김의 경우 사이즈업할 때 사용하는 함수 추가
    func sizeCheck(type: Product, userInfo: UserInfo, userInput: Int) {
        var selectSize: Bool = true // size를 선택하는 while문을 종료시키기 위해 성넌
        while selectSize {
            var sizeList: [Menu] = [] // size[[little, 0.0], [regular, 2.0], [large, 4.0]]
            
            for i in Product.sizeup.productName.indices { // 열거형으로 선언해 놓은 Product에 접근하여 sizeup에 저장된 목록을 sizeList에 저장.
                sizeList.append(Menu(Product.sizeup.productName[i], Product.sizeup.productPrice[i]))
            }
            if(type.name == "버거"){
                sizeList.remove(at: sizeList.count - 1)
            }

            // 사이즈 선택 목록 display
            print("[ \(type.productName[userInput - 1]) \(Product.sizeup.name) ]") // 사이즈 선택
            for (index, size) in sizeList.enumerated() { // sizeList에 저장한 목록 표시
                if size.price < 0 {
                    print("\(index + 1). \(size.name) | - W \(abs(size.price)) |")
                } else {
                    print("\(index + 1). \(size.name) | + W \(size.price) |")
                }
            }
            print("0. 뒤로가기\n")
            
            // 숫자인지 아닌지 구분
            guard let sizeInput = readLine(),
                  let sizeInput = Int(sizeInput) else {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            // ???
            if userInfo.pickMenu.isEmpty && userInput == sizeList.count + 1 {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            
            switch sizeInput {
            case 0:
                print("뒤로가기를 선택하셨습니다. \n")
                return
            case (1...sizeList.count):
                
                var sizeupList: [Menu] = [] // size up을 한 경우 메뉴의 이름과 가격을 바꿔서 저장하기 위해 해당 변수 선언
                var menuSizeName: String = type.productName[userInput - 1] + " \(sizeList[sizeInput - 1].name)"// menu에 사이즈를 추가
                var menuSizePrice: Double = type.productPrice[userInput - 1] + sizeList[sizeInput - 1].price // 해당 메뉴 가격에 사이즈 변화 가격을 더함.
                
                sizeupList.append(Menu(menuSizeName, menuSizePrice))
                
                // 장바구니에 저장
//                            userInfo.updateMenu(data: sizeupList[userInput - 1])
                print("\(sizeupList[sizeupList.count - 1].name)를 주문하셨습니다. 가격은 \(Int(sizeupList[sizeupList.count - 1].price * 1000))원 입니다. \n")

                selectSize = false // 사이즈를 선택한 경우 사이즈 선택 while문을 종료
                continue
                
            default:
                print("올바른 메뉴를 입력해주세요. \n")
            }
        }
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
