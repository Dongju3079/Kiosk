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
        
        // 임의로 배열 만들어 장바구니에 담는 테스트중
        // ShoppingCart().printShoppingCart(payItem: drinkList)
        // 중복제거하여 수량을 나타내는 기능도 필요
        // 항목별로 나누어서 표시하는 기능도 필요

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
                userInfo.updateMenu(data: drinkList[userInput - 1])
                print("\(drinkList[userInput - 1].name)를 주문하셨습니다. 가격은 \(drinkList[userInput - 1].price)00원 입니다. \n")
                continue
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
