import Foundation

class ShoppingCart {

    func printShoppingCart(payItem: [Menu]) {
        
        print ("""
                [장바구니]
                ---------주문내역확인-----------
                """)
        
        var sumItem: Decimal = 0
        
        var payItem_burgers: [Menu] = []
        var payItem_dogs: [Menu] = []
        var payItem_sandwiches: [Menu] = []
        var payItem_fries: [Menu] = []
        var payItem_milkshakes: [Menu] = []
        var payItem_drinks: [Menu] = []
        
        for item in payItem {
            if (Product.burgers.productName.contains(item.name)) {
                // 햄버거
                payItem_burgers.append(item)
            }
            else if(Product.hotdogs.productName.contains(item.name)) {
                // 핫도그
                payItem_dogs.append(item)
            }
            else if(Product.sandwiches.productName.contains(item.name)) {
                // 샌드위치
                payItem_sandwiches.append(item)
            }
            else if(Product.fries.productName.contains(item.name)) {
                // 감자튀김
                payItem_fries.append(item)
            }
            else if(Product.shake.productName.contains(item.name)) {
                // 밀크쉐이크
                payItem_milkshakes.append(item)
            }
            else if(Product.drink.productName.contains(item.name)) {
                // 음료
                payItem_drinks.append(item)
            }
            sumItem += item.price
        }
        
        // 버거
        displayItem(index: 0, items: payItem_burgers)
        // 핫도그
        displayItem(index: 1, items: payItem_dogs)
        // 음료
        displayItem(index: 2, items: payItem_drinks)
        // 밀크쉐이크
        displayItem(index: 3, items: payItem_milkshakes)
        // 샌드위치
        displayItem(index: 4, items: payItem_sandwiches)
        // 감자튀김
        displayItem(index: 5, items: payItem_fries)
        
        print("----------------------------")
        print("총 수량 : \(payItem.count)")

        let sumPrice: Decimal = sumItem * 1000
        let surtax: Decimal = sumPrice * 0.1
        let payment: Decimal = sumPrice + surtax
        
        print("총 합계 : \(payment)원")
        print("----------------------------")
        
        confirmation()
        
        func displayItem(index: Int, items: [Menu]){
            let typeList: [String] = ["Burgers", "Dogs", "Sandwiches", "Fries", "Milkshakes", "Drinks"]
            print("\(index + 1). \(typeList[index])")
            for item in items {
                print("\(item.name) | W \(item.price) |")
            }
        }
        
        func confirmation() {
            print ("🖥️ 아래 메뉴에서 원하시는 동작을 선택해주세요. 🖥️")
            print("""
                1. 메뉴취소
                2. 결제
                3. 추가주문
                """)
            let userInput = readLine()
            
            switch userInput {
//            case "1": 지욱님? 동주님? 이 만드신 메뉴취소 메소드 추가
//            case "2": 동주님이 만드신 결제 메소드 추가
            case "3": printHomeKiosk()
            default: print("올바른 메뉴를 입력해주세요")
            }
        }
    }
}
