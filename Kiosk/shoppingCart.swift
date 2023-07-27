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
        
        
//        print(string_right(text: "TOTAL : ", lenghth: 45) + string_right(text: numberFormatter(value: payment) + " KRW", lenghth: 13))
        
        print("\(String(repeating: "-", count: 58))")
        
        
        confirmation()
        
        
        func displayItem(index: Int, items: [Menu]){
           let typeList: [String] = ["Burgers", "Dogs", "Sandwiches", "Fries", "Milkshakes", "Drinks"]

           print(" \(index + 1). \(typeList[index])")
           
//           for item in items {
//               var itemName: String = item.name.leftPadding(toLength: 30, withPad: " ")
//               print("\(item.name) | W  \(item.price)  |  \(item.count)  |  W \(numberFormatter(value: (item.priceSum * 1000)))")
//           }
//
//        func countItem(payItem: [Receipt]) -> [Receipt]{
//
//                var Item: [Receipt] = payItem
//
//                // string name만 비교했을 때 동일한 것이 몇개가 있는지 확인한다.
//                var payItem_name: [String] = [] // 장바구니에 있는 메뉴들의 name을 저장함.
//
//                for index in 0..<Item.count {
//                    payItem_name.append(Item[index].name)
//                }
//
//                let count_payItem_name = NSCountedSet(array: payItem_name) // 중복되는 갯수를 확인하기 위한 변수
//
//                // 순차적으로 정렬
//                payItem_name.sort(by: {$0 > $1})
//                Item.sort(by: {$0.name > $1.name})
//
//                for index in 0..<payItem_name.count{
//
//                    if (index == payItem_name.count) {
//                        break
//                    }
//
//        //            print("index : \(index)")
//                    if count_payItem_name.count(for: payItem_name[index]) > 1 { // 중복되는 것이 하나 이상인 경우
//        //                print("if) index : \(index), count : \(count_payItem_name.count(for: payItem_fries_name[index]))")
//                        payItem_name.removeSubrange((index + 1)...(index + count_payItem_name.count(for: payItem_name[index]) - 1))
//                        Item.removeSubrange((index + 1)...(index + count_payItem_name.count(for: payItem_name[index]) - 1))
//
//                        Item[index] = Receipt(name: Item[index].name, price: Item[index].price, count: count_payItem_name.count(for: payItem_name[index]), priceSum: Item[index].price * Decimal(count_payItem_name.count(for: payItem_name[index])))
//                    }
//                }
//                return Item
//            }
            
            func string_right(text: String, lenghth: Int) -> String{
                    var textLeft: String = text.leftPadding(toLength: lenghth, withPad: " ")
                    return textLeft
                }
            
            func numberFormatter(value: Decimal) -> String {
                    let numberFormatter: NumberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal

                    return numberFormatter.string(for: value)!
                }
            }
       }

        
        func confirmation() {
            print ("🖥️ 원하시는 동작을 선택해주세요. 🖥️")
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
            default: confirmation()
            }
        }
    }


extension String {
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        let stringLength = self.count
        if stringLength < toLength {
            return String(repeatElement(character, count: toLength - stringLength)) + self
        } else {
            return String(self.suffix(toLength))
        }
    }
}
