//
//  receipt.swift
//  Kiosk
//
//  Created by t2023-m0059 on 2023/07/25.
//

import Foundation

class PrintReceipt {
    
    var maxString: Int = 0
    
    func printReceipt(payItem: [Menu], remainMoney: Decimal){
        
        // 장바구니에서 받아온 payItem에서 이름의 최대 문자열 찾기
        var payItem_name_length: [Int] = [] // 장바구니에 있는 메뉴들의 name을 저장함.
        
        for index in 0..<payItem.count {
            payItem_name_length.append(payItem[index].name.count)
        }
        maxString = payItem_name_length.max() ?? 35
        print("test : \(payItem_name_length), max : \(payItem_name_length.max())")
        
        print("\(String(repeating: "-", count: 23)) Receipt \(String(repeating: "-", count: 23))")
        // 결제 시간
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDate = formatter.string(from: Date())
        print("결제 시간 : \(currentDate)")
        
        print("\(String(repeating: "-", count: 55))")
        
        print("\(String(repeating: " ", count: 15))ITEM\(String(repeating: " ", count: 15)) | Unit | QTY | PRICE")
        
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
        
//        print("최종 fries 저장 목록")
//        for i in 0..<payItem_fries.count {
//            print("name : \(payItem_fries[i].name), price : \(payItem_fries[i].price), count : \(payItem_fries[i].count), priceSum : \(payItem_fries[i].priceSum)")
//        }
        //
        
        /*
         // 각 menu별로 구분하고 중복되는 항목을 지우고 count와 총 합계를 저장하기 위해 선언
         //        var receiptBurgers: [Receipt] = []
         //        var receiptDogs: [Receipt] = []
         //        var receiptSandwiches: [Receipt] = []
         var receiptFries: [Receipt] = []
         //        var receiptMilkshakes: [Receipt] = []
         //        var receiptDrinks: [Receipt] = []
         
         var payItem_fries_name: [String] = [] // 장바구니에 있는 메뉴들의 name을 저장함.
         
         for index in 0..<payItem_fries.count {
         payItem_fries_name.append(payItem_fries[index].name)
         }
         print("test : \(payItem_fries_name)")
         
         // 수량 확인 부분
         // 상단에서 감자튀김 목록만 분류한 것에서 차례대로 확인
         // Error.. 지금 가지고 있는 것 빼고 검사를 해야함.
         for (index, a) in payItem_fries.enumerated() { // 감자튀김 모든 것들을 가지고옴.
         print("index : \(index)")
         // 이미 존재하는지 확인하기.
         let countArray = NSCountedSet(array: payItem_fries_name)
         
         if(payItem_fries_name.contains(a.name) && countArray.count(for: a.name) > 1){ // Error.. 당연히 본인께 있겠지.
         // 중복이 된 경우
         // 이미 있는 것에서 몇번과 같은지 확인한다. - 중복된 것의 Index 확인
         var overlapIndex: Int = 0
         overlapIndex = payItem_fries_name.firstIndex(of: a.name) ?? 0
         // 이미 저장한 배열에서 count의 값을 변경한다.
         if(receiptFries.count == 0){
         receiptFries.append(Receipt(name: a.name, price: a.price, count: 1, priceSum: a.price * 1))
         } else {
         receiptFries[overlapIndex] = Receipt(name: receiptFries[overlapIndex].name, price: receiptFries[overlapIndex].price, count: receiptFries[overlapIndex].count + 1, priceSum: receiptFries[overlapIndex].price * Double((receiptFries[overlapIndex].count + 1)))
         }
         } else {
         // 중복이 아닌 경우
         // 새롭게 지정한 배열에 저장한다.
         receiptFries.append(Receipt(name: a.name, price: a.price, count: 1, priceSum: a.price * 1))
         }
         print("index : \(index), receiptFries 수 : \(receiptFries.count)")
         }
         
         print("최종 test")
         for i in 0..<receiptFries.count {
         print("name : \(receiptFries[i].name), price : \(receiptFries[i].price), count : \(receiptFries[i].count), priceSum : \(receiptFries[i].priceSum)")
         }
         */
        
        // 버거
        displayItem(index: 0, items: payItem_burgers)
        // 핫도그
        displayItem(index: 1, items: payItem_dogs)
        // 샌드위치
        displayItem(index: 2, items: payItem_sandwiches)
        // 감자튀김
        displayItem(index: 3, items: payItem_fries)
//        displayItem(index: 3, items: payItem_fries)
        // 밀크쉐이크
        displayItem(index: 4, items: payItem_milkshakes)
        // 마실 것
        displayItem(index: 5, items: payItem_drinks)
        
        print("\(String(repeating: "-", count: 55))")
        
        print("총 품목 수량 : \(payItem.count)")
        
        let sumPrice: Decimal = sumItem * 1000
        print("총 품목 금액 : \(sumPrice)원")
        // 부가세 (10%)
        let surtax: Decimal = sumPrice * 0.1
        print("부가세(10%) : \(surtax)원")
        
        let payment: Decimal = sumPrice + surtax
        print("합계 : \(payment)원")
        
        print("\(String(repeating: "-", count: 55))")
        
        print("결제 방식 : 현금")
        print("현재 금액 : \(payment + remainMoney)원")
        print("결제 대상 금액 : \(payment)원")
        print("남은 금액 : \(remainMoney)원")
        
        print("\(String(repeating: "-", count: 55))")
    }
    func displayItem(index: Int, items: [Receipt]){
        
        let typeList: [String] = ["Burgers", "Dogs", "Sandwiches", "Fries", "Milkshakes", "Drinks"]
        
        print("\(index + 1). \(typeList[index])")
        
        for item in items {
//            print("상품명 / 단가 / 수량 / 금액")
            var empty: String = String(repeating: " ", count: maxString - item.name.count)
            print("\(empty)\(item.name) | W \(item.price) | \(item.count) | W \(item.priceSum)")
        }
    }
    
    func countItem(payItem: [Receipt]) -> [Receipt]{
        
        var Item: [Receipt] = payItem
        
//        print("fries 저장 목록")
//        for i in 0..<Item.count {
//            print("name : \(Item[i].name), price : \(Item[i].price), count : \(Item[i].count), priceSum : \(Item[i].priceSum)")
//        }
        
        // string name만 비교했을 때 동일한 것이 몇개가 있는지 확인한다.
        var payItem_name: [String] = [] // 장바구니에 있는 메뉴들의 name을 저장함.
        
        for index in 0..<Item.count {
            payItem_name.append(Item[index].name)
        }
        
        let count_payItem_name = NSCountedSet(array: payItem_name) // 중복되는 갯수를 확인하기 위한 변수
        
        // 순차적으로 정렬
        payItem_name.sort(by: {$0 > $1})
        Item.sort(by: {$0.name > $1.name})
        
//        print("fries 정렬 완료")
//        for i in 0..<payItem_fries_name.count {
//            print("name : \(payItem_fries_name[i])")
//        }
        
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
//        print("fries 저장 목록")
//        for i in 0..<Item.count {
//            print("name : \(Item[i].name), price : \(Item[i].price), count : \(Item[i].count), priceSum : \(Item[i].priceSum)")
//        }
        return Item
    }
}
