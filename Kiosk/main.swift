import Foundation

while true {
    printHomeKiosk()
    
    let userInput = readLine()
            
    switch userInput {
    case "0":
        print("프로그램을 종료합니다.")
        exit(0)
    case "1":
        OrderManager().orderDrinks(type: .burgers, userInfo: UserInfo())
        break
    case "2":
        OrderManager().orderDrinks(type: .hotdogs, userInfo: UserInfo())
        break
    case "3":
        OrderManager().orderDrinks(type: .drink, userInfo: UserInfo())
        break
    case "4":
        OrderManager().orderDrinks(type: .shake, userInfo: UserInfo())
        break
    case "5":
        OrderManager().orderDrinks(type: .sandwiches, userInfo: UserInfo())
        break
    case "6":
        OrderManager().orderDrinks(type: .fries, userInfo: UserInfo())
        break
    case "7":
        ShoppingCart().printShoppingCart(payItem: [])
        
    default:
        print("올바른 메뉴를 입력해주세요.")
    }
}

func printHomeKiosk() {
    print("""
    🖥️ 아래 메뉴판을 보시고 메뉴를 골라 입력해주세요. 🖥️

    [ FIVE JAYS MENU ]
    1. Burgers         | 비프 통살을 다져만든 버거
    2. Hotdog          | 매장에서 신선하게 만드는 핫도그
    3. Drinks          | 매장에서 직접 만드는 음료
    4. Milkshakes      | Five Jays만의 특별한 밀크셰이크
    5. Sandwiches      | 엄마손 샌드위치
    6. Fries           | 매장에서 신선하게 튀긴 후렌치프라이
    7. 장바구니          | 주문한 상품을 확인
    0. 종료             | 프로그램 종료
    
    """)
}
