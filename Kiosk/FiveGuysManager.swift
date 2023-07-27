//
//  FiveGuysManager.swift
//  Kiosk
//
//  Copyright (c) 2023 z-wook. All right reserved.
//

import Foundation

final class OrderManager {
    
    func orderFoods(type: Product, userInfo: UserInfo, completion: () -> Void) {
        var drinkList: [Menu] = []
        
        for i in type.productName.indices {
            drinkList.append(Menu(type.productName[i], (type.productPrice[i])))
        }
        
        while true {
            noticeFoodMenu(type: type, drinkList, pickMenus: UserInfo.poket)
            guard let userInput = readLine(),
                  let userInput = Int(userInput) else {
                print("‼️ 올바른 메뉴를 입력해주세요.")
                continue
            }
            if UserInfo.poket.isEmpty && userInput == drinkList.count + 1 {
                print("‼️ 올바른 메뉴를 입력해주세요. \n")
                continue
            }
            
            switch userInput {
            case 0:
                print("🖥️ 뒤로가기를 선택하셨습니다.\n")
                completion()
                return
            case (1...drinkList.count):
                if type.name == "Fries" || type.name == "Burger" { // 사이즈 체크
                    sizeCheck(type: type, userInfo: userInfo, userInput: userInput)
                } else {
                    userInfo.updatePoket(food: drinkList[userInput - 1])
                    print("🖥️ \(drinkList[userInput - 1].name)를 주문하셨습니다. 가격은 \(drinkList[userInput - 1].price * 1000)원 입니다. \n")
                    continue
                }
                
            case drinkList.count + 1: // 삭제
                
            INTER:while true {
                printPickedMenu(pickMenus: UserInfo.poket)
                
                guard UserInfo.poket.isEmpty != true else {
                    print("🖥️ 장바구니가 비었습니다.")
                    break
                }
                
                guard let userInput = readLine(),
                      let userInput = Int(userInput) else { continue }
                
                switch userInput {
                case 1...UserInfo.poket.count:
                    userInfo.removePoket(index: userInput - 1)
                case 0:
                    break INTER
                default: print("🖥️ 올바른 메뉴를 입력해주세요. \n")
                }
            }
                
            default:
                print("🖥️ 올바른 메뉴를 입력해주세요. \n")
            }
        }
    }
}

extension OrderManager {
    func noticeFoodMenu(type: Product, _ foodList: [Menu], pickMenus: [Menu]) {
        let totalLength = 40
        let paddingLength = totalLength - Int(type.rawValue.count) - 10
        let padding = String(repeating: " ", count: paddingLength / 2)
        
        print("")
        print("*-----------------------------------*")
        print("|\(padding)\(type.name) MENU\(padding)|")
        print("*-----------------------------------*")
        for (index, food) in foodList.enumerated() {
            let num = String(format: "%2d", index + 1)
            let menuName = food.name.padding(toLength: 20, withPad: " ", startingAt: 0)
            let menuPrice = NSDecimalNumber(decimal: food.price).doubleValue // double로 형변환
            let formattedPrice = String(format: "%4g", menuPrice) // g 서식지정자: 소수점 이하 0을 제거

            print("| \(num). \(menuName) | W \(formattedPrice) |")
        }


        print("*-----------------------------------*")
        print("|  0. 뒤로가기 ⏪                     |")
        print("*-----------------------------------*")
        print("")
        print("🖥️ 메뉴를 입력하세요: ", terminator: "")

    }
    
    func printPickedMenu(pickMenus: [Menu]) {
        print("취소할 식품을 선택해주세요.")
        for (index, drink) in pickMenus.enumerated() {
            print("\(index + 1). \(drink.name) | W \(drink.price) |")
        }
        print("0. 뒤로가기\n")
    }
    
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
            if UserInfo.poket.isEmpty && userInput == sizeList.count + 1 {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            
            switch sizeInput {
            case 0:
                print("뒤로가기를 선택하셨습니다. \n")
                return
            case (1...sizeList.count):
                
                var sizeupList: [Menu] = [] // size up을 한 경우 메뉴의 이름과 가격을 바꿔서 저장하기 위해 해당 변수 선언
                let menuSizeName: String = type.productName[userInput - 1] + " \(sizeList[sizeInput - 1].name)"// menu에 사이즈를 추가
                let menuSizePrice: Decimal = type.productPrice[userInput - 1] + sizeList[sizeInput - 1].price // 해당 메뉴 가격에 사이즈 변화 가격을 더함.
                
                sizeupList.append(Menu(menuSizeName, menuSizePrice))
                
                // 장바구니에 저장
                //                            userInfo.updateMenu(data: sizeupList[userInput - 1])
                print("\(sizeupList[sizeupList.count - 1].name)를 주문하셨습니다. 가격은 \(sizeupList[sizeupList.count - 1].price * 1000))원 입니다. \n")
                
                print("\(sizeupList[sizeupList.count - 1].name)를 주문하셨습니다. 가격은 \(sizeupList[sizeupList.count - 1].price * 1000)원 입니다. \n")

                selectSize = false // 사이즈를 선택한 경우 사이즈 선택 while문을 종료
                continue
                
            default:
                print("올바른 메뉴를 입력해주세요. \n")
            }
        }
    }
}
