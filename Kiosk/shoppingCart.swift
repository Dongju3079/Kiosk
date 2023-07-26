import Foundation

class ShoppingCart {
    
    // var menuInput: Int?
    
    func printShoppingCart(payItem: [Menu]) {
        print ("---------주문내역확인-----------")
        
        var sumItem: Double = 0
        
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
        displayItem(index: 3, items: payItem_drinks)
        // 밀크쉐이크
        displayItem(index: 3, items: payItem_milkshakes)
        // 샌드위치
        displayItem(index: 4, items: payItem_sandwiches)
        // 감자튀김
        displayItem(index: 5, items: payItem_fries)
        
        print("--------------------------")
        print("총 품목 수량 : \(payItem.count)")
        var sumPrice: Double = sumItem * 100
        print("총 품목 금액 : \(Int(sumPrice))원")
        // 부가세 (10%)
        var surtax: Int = Int(sumPrice * 0.1)
        print("부가세(10%) : \(surtax)원")
        var payment: Int = Int(sumPrice) + surtax
        print("합계 : \(payment)원")
        print("--------------------------")
        
        func displayItem(index: Int, items: [Menu]){
            let typeList: [String] = ["Burgers", "Dogs", "Sandwiches", "Fries", "Milkshakes", "Drinks"]
            print("\(index + 1). \(typeList[index])")
            for item in items {
                print("\(item.name) | W \(item.price) |")
            }
        }
    }
    
    func reorder() {
        // 추가주문 다시 묻는 메세지 팝업
        print ("추가로 주문 하시겠습니까?")
        
        let userInput = readLine()
        
        switch userInput {
        case "1": print("1. 네")
        case "2": print("2. 아니오")
        default: print("올바른 메뉴를 입력해주세요")
        }
        
        guard let userInput = userInput else{
            print ("올바른 메뉴를 입력해주세요")
            reorder()
            return
        }
        guard let userInput = Int(userInput) else{
            //유저인풋이 정수가 아닌 자료형일때
            print ("올바른 메뉴를 입력해주세요")
            reorder()
            return
        }
        if userInput == 1 {
            print ("상품을 장바구니에 담아주세요")
            // 메인페이지로 이동
        }
        else if userInput == 2 {
            print ("결제페이지로 넘어갑니다")
            // 결제페이지로 이동
        }
        else {
            print ("올바른 메뉴를 입력해주세요")
            reorder()
        }
    }
}
