import Foundation

final class UserInfo {
    var pickMenu: [Menu] = []
    
    func updateMenu(data: Menu) {}
    
    func removeMenu(data: Menu) {}
}

final class OrderManager {
    func orderFoods(type: Product, userInfo: UserInfo) {
    
        
    var shoppingList: [Menu] = [] // 이제 여기에 유저가 선택한 상품을 담아야 하는데...
    
    for food in type.productName.indices {
        shoppingList.append(Menu(type.productName[food], type.productPrice[food]))
    }
        
    func shoppingList() {
      print("장바구니 항목")
        for (index, food) in shoppingList.enumerated() {
            print("\(index + 1). \(food.name) | W \(food.price)")
        }
    }

        while true {
            printDrinksMenu(type: type, shoppingList, pickMenus: userInfo.pickMenu)
            
            guard let userInput = readLine(),
                  let userInput = Int(userInput) else {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            
            if userInfo.pickMenu.isEmpty && userInput == shoppingList.count + 1 {
                print("올바른 메뉴를 입력해주세요. \n")
                continue
            }
            
            switch userInput {
            case 0:
                print("뒤로가기를 선택하셨습니다. \n")
                return
            case (1..<7):
                userInfo.updateMenu(data: shoppingList[userInput - 1])
                print("\(shoppingList[userInput - 1].name)를 주문하셨습니다. 가격은 \(shoppingList[userInput - 1].price)00원 입니다. \n")
                continue
            case 7:
                ShoppingCart().printShoppingCart(payItem: shoppingList)
                // 임의로 배열 만들어 장바구니에 담는 테스트중
                // 중복제거하여 수량을 나타내는 기능도 필요
                // 항목별로 나누어서 표시하는 기능도 필요
                continue
                
            case (shoppingList.count + 1): // 삭제
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
