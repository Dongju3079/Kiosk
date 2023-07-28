//
//  receipt.swift
//  Kiosk
//
//  Created by t2023-m0059 on 2023/07/25.
//

import Foundation

class PrintReceipt {
    
    func printReceipt(payItem: [Menu], remainMoney: Decimal){
        
        print("\(String(repeating: "-", count: 24)) Receipt \(String(repeating: "-", count: 25))")
        // 결제 시간
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDate = formatter.string(from: Date())
        print(" Payment Time : \(currentDate)")
        
        print("\(String(repeating: "-", count: 58))")
        
        print("\(String(repeating: " ", count: 13))ITEM\(String(repeating: " ", count: 13)) |   Unit  | QTY |   PRICE")
        
        var sumItem: Decimal = 0 // 장바구니에 있는 item의 총 가격 합
        // 각 menu별로 구분하기 위해 선언
        var payItem_burgers: [Receipt] = []
        var payItem_dogs: [Receipt] = []
        var payItem_sandwiches: [Receipt] = []
        var payItem_fries: [Receipt] = []
        var payItem_milkshakes: [Receipt] = []
        var payItem_drinks: [Receipt] = []
        
        for item in payItem {
            if (item.name.contains(Product.burger.productName[0]) || item.name.contains(Product.burger.productName[1]) || item.name.contains(Product.burger.productName[2]) || item.name.contains(Product.burger.productName[3])) { // 햄버거에는 사이즈가 추가되기 때문에 원래 햄버거 메뉴부분과 겹치는 부분이 있는지로 확인함.
                // 햄버거
                payItem_burgers.append(Receipt(name: item.name, price: item.price, count: 1, priceSum: item.price))
            } else if(Product.hotdog.productName.contains(item.name)) {
                // 핫도그
                payItem_dogs.append(Receipt(name: item.name, price: item.price, count: 1, priceSum: item.price))
            } else if(Product.sandwiches.productName.contains(item.name)) {
                // 샌드위치
                payItem_sandwiches.append(Receipt(name: item.name, price: item.price, count: 1, priceSum: item.price))
            } else if(item.name.contains(Product.fries.productName[0]) || item.name.contains(Product.fries.productName[1])) { // 감자 튀김에는 사이즈가 추가되기 때문에 원래 감자튀김 메뉴부분과 겹치는 부분이 있는지로 확인함.
                // 감자튀김
                payItem_fries.append(Receipt(name: item.name, price: item.price, count: 1, priceSum: item.price))
            } else if(Product.shake.productName.contains(item.name)) {
                // 밀크쉐이크
                payItem_milkshakes.append(Receipt(name: item.name, price: item.price, count: 1, priceSum: item.price))
            } else if(Product.drink.productName.contains(item.name)) {
                // 음료
                payItem_drinks.append(Receipt(name: item.name, price: item.price, count: 1, priceSum: item.price))
            }
            sumItem += item.price
        }
        
        //  중복 확인
        payItem_burgers = countItem(payItem: payItem_burgers)
        payItem_dogs = countItem(payItem: payItem_dogs)
        payItem_sandwiches = countItem(payItem: payItem_sandwiches)
        payItem_fries = countItem(payItem: payItem_fries)
        payItem_milkshakes = countItem(payItem: payItem_milkshakes)
        payItem_drinks = countItem(payItem: payItem_drinks)
        
        // display에 사용되는 변수
        let displayTypeName: [String] = ["Burgers", "Dogs", "Sandwiches", "Fries", "Milkshakes", "Drinks"]
        let displayTypeItem: [[Receipt]] = [payItem_burgers, payItem_dogs, payItem_sandwiches, payItem_fries, payItem_milkshakes, payItem_drinks]
        
        var MenuTitleNum: Int = 0
        
        for index in 0..<displayTypeName.count {
            if !displayTypeItem[index].isEmpty {
                MenuTitleNum += 1
                displayItem(index: MenuTitleNum, typeName: displayTypeName[index], items: displayTypeItem[index])
            } else {
            }
        }
        
        print("\(String(repeating: "-", count: 58))")

        print(string_right(text: "Total Item Quantity : ", lenghth: 45) + string_right(text: String(payItem.count), lenghth: 13))
        
        let sumPrice: Decimal = (sumItem * 1000) * 0.9
        print(string_right(text: "SUB TOTAL : ", lenghth: 45) + string_right(text: numberFormatter(value: sumPrice) + " KRW", lenghth: 13))
        // 부가세 (10%)
        let surtax: Decimal = (sumItem * 1000) * 0.1
        print(string_right(text: "VAT (10%) : ", lenghth: 45) + string_right(text: numberFormatter(value: surtax) + " KRW", lenghth: 13))
        
        let payment: Decimal = sumPrice + surtax
        print(string_right(text: "TOTAL : ", lenghth: 45) + string_right(text: numberFormatter(value: payment) + " KRW", lenghth: 13))
        
        print("\(String(repeating: "-", count: 58))")
        
        print(string_right(text: "PAYMENT METHOD : ", lenghth: 45) + string_right(text: "CASH", lenghth: 13))
        print(string_right(text: "CURRENT AMOUNT : ", lenghth: 45) + string_right(text: numberFormatter(value: (payment + remainMoney)) + " KRW", lenghth: 13))
        print(string_right(text: "AMOUNT DUE : ", lenghth: 45) + string_right(text: numberFormatter(value: payment) + " KRW", lenghth: 13))
        print(string_right(text: "BALANCE : ", lenghth: 45) + string_right(text: numberFormatter(value: remainMoney) + " KRW", lenghth: 13))
        
        print("\(String(repeating: "-", count: 58))")
    }
    
    func displayItem(index: Int, typeName: String, items: [Receipt]){
        
//        let typeList: [String] = ["Burgers", "Dogs", "Sandwiches", "Fries", "Milkshakes", "Drinks"]
        
        print(" \(index). \(typeName)")
        
        for item in items {
            let itemName: String = item.name.leftPadding(toLength: 30, withPad: " ")
            var itemPrice: String = "\(item.price)"
            itemPrice = itemPrice.leftPadding(toLength: 4, withPad: " ")
            print("\(itemName) | W \(itemPrice)  |  \(item.count)  |  W \(numberFormatter(value: (item.priceSum * 1000)))")
        }
    }
    
    func countItem(payItem: [Receipt]) -> [Receipt]{
        
        var Item: [Receipt] = payItem
        
        // string name만 비교했을 때 동일한 것이 몇개가 있는지 확인한다.
        var payItem_name: [String] = [] // 장바구니에 있는 메뉴들의 name을 저장함.
        
        for index in 0..<Item.count {
            payItem_name.append(Item[index].name)
        }
        
        let count_payItem_name = NSCountedSet(array: payItem_name) // 중복되는 갯수를 확인하기 위한 변수
        
        // 순차적으로 정렬
        payItem_name.sort(by: {$0 > $1})
        Item.sort(by: {$0.name > $1.name})
        
        for index in 0..<payItem_name.count{
            
            if (index == payItem_name.count) {
                break
            }
            
//            print("index : \(index)")
            if count_payItem_name.count(for: payItem_name[index]) > 1 { // 중복되는 것이 하나 이상인 경우
//                print("if) index : \(index), count : \(count_payItem_name.count(for: payItem_fries_name[index]))")
                payItem_name.removeSubrange((index + 1)...(index + count_payItem_name.count(for: payItem_name[index]) - 1))
                Item.removeSubrange((index + 1)...(index + count_payItem_name.count(for: payItem_name[index]) - 1))
                
                Item[index] = Receipt(name: Item[index].name, price: Item[index].price, count: count_payItem_name.count(for: payItem_name[index]), priceSum: Item[index].price * Decimal(count_payItem_name.count(for: payItem_name[index])))
            }
        }
        return Item
    }
    
    func string_right(text: String, lenghth: Int) -> String{
        let textLeft: String = text.leftPadding(toLength: lenghth, withPad: " ")
        return textLeft
    }
    
    func numberFormatter(value: Decimal) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        return numberFormatter.string(for: value)!
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
