//
//  receipt.swift
//  Kiosk
//
//  Created by t2023-m0059 on 2023/07/25.
//

import Foundation

class PrintReceipt {
    func printReceipt(payItem: [Menu], remainMoney: Decimal){
        print("---------- 영수증 ---------")
        // 결제 시간
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDate = formatter.string(from: Date())
        print("결제 시간 : \(currentDate)")
        print("-------------------------")
        print("상품명 / 단가 / 수량 / 금액")
        
        var sumItem: Decimal = 0 // 장바구니에 있는 item의 총 가격 합
        // 각 menu별로 구분하기 위해 선언
        var payItem_burgers: [Menu] = []
        var payItem_dogs: [Menu] = []
        var payItem_sandwiches: [Menu] = []
        var payItem_fries: [Receipt] = []
        var payItem_milkshakes: [Menu] = []
        var payItem_drinks: [Menu] = []
        
        for item in payItem {
            if (Product.fries.productName.contains(item.name)) {
                // 햄버거
                payItem_burgers.append(item)
            } else if(Product.fries.productName.contains(item.name)) {
                // 핫도그
                payItem_dogs.append(item)
            } else if(Product.fries.productName.contains(item.name)) {
                // 샌드위치
                payItem_sandwiches.append(item)
            } else if(item.name.contains(Product.fries.productName[0]) || item.name.contains(Product.fries.productName[1])) { // 감자 튀김에는 사이즈가 추가되기 때문에 원래 감자튀김 메뉴부분과 겹치는 부분이 있는지로 확인함.
                // 감자튀김
                payItem_fries.append(Receipt(name: item.name, price: item.price, count: 0, priceSum: 0)) //test
            } else if(Product.fries.productName.contains(item.name)) {
                // 밀크쉐이크
                payItem_milkshakes.append(item)
            } else if(Product.fries.productName.contains(item.name)) {
                // 음료
                payItem_drinks.append(item)
            }
            sumItem += item.price
        }
        
        print("fries 저장 목록")
        for i in 0..<payItem_fries.count {
            print("name : \(payItem_fries[i].name), price : \(payItem_fries[i].price), count : \(payItem_fries[i].count), priceSum : \(payItem_fries[i].priceSum)")
        }
        
        // string name만 비교했을 때 동일한 것이 몇개가 있는지 확인한다.
        var payItem_fries_name: [String] = [] // 장바구니에 있는 메뉴들의 name을 저장함.
        
        for index in 0..<payItem_fries.count {
            payItem_fries_name.append(payItem_fries[index].name)
        }
        
        let count_payItem_fries_name = NSCountedSet(array: payItem_fries_name) // 중복되는 갯수를 확인하기 위한 변수
        
        payItem_fries_name.sort() // 순차적으로 정렬
        
        print("fries 정렬 완료")
        for i in 0..<payItem_fries_name.count {
            print("name : \(payItem_fries_name[i])")
        }
        
        for index in 0..<payItem_fries_name.count{
            
            if (index == payItem_fries_name.count) {
                break
            }
            
            print("index : \(index)")
            if count_payItem_fries_name.count(for: payItem_fries_name[index]) > 1 { // 중복되는 것이 하나 이상인 경우
//                print("if) index : \(index), count : \(count_payItem_fries_name.count(for: payItem_fries_name[index]))")
                payItem_fries_name.removeSubrange((index + 1)...(index + count_payItem_fries_name.count(for: payItem_fries_name[index]) - 1))
                payItem_fries.removeSubrange((index + 1)...(index + count_payItem_fries_name.count(for: payItem_fries_name[index]) - 1))

                print("fries 제거 후")
                for i in 0..<payItem_fries_name.count {
                    print("name : \(payItem_fries_name[i])")
                }
            }
        }
        print("fries 저장 목록")
        for i in 0..<payItem_fries.count {
            print("name : \(payItem_fries[i].name), price : \(payItem_fries[i].price), count : \(payItem_fries[i].count), priceSum : \(payItem_fries[i].priceSum)")
        }
        
        
        
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
        displayItem(index: 1, items: payItem_burgers)
        // 샌드위치
        displayItem(index: 2, items: payItem_burgers)
        // 감자튀김
        displayItem(index: 3, items: payItem_fries)
        // 밀크쉐이크
        displayItem(index: 4, items: payItem_burgers)
        // 마실 것
        displayItem(index: 5, items: payItem_burgers)
        
        print("--------------------------")
        print("총 품목 수량 : \(payItem.count)")
        let sumPrice: Decimal = sumItem * 1000
        print("총 품목 금액 : \(sumPrice)원")
        // 부가세 (10%)
        let surtax: Decimal = sumPrice * 0.1
        print("부가세(10%) : \(surtax)원")
        let payment: Decimal = sumPrice + surtax
        print("합계 : \(payment)원")
        print("--------------------------")
        print("결제 방식 : 현금")
        print("현재 금액 : \(payment + remainMoney)원")
        print("결제 대상 금액 : \(payment)원")
        print("남은 금액 : \(remainMoney)원")
        print("--------------------------")
    }
    
    func displayItem(index: Int, items: [Menu]){
        
        let typeList: [String] = ["Burgers", "Dogs", "Sandwiches", "Fries", "Milkshakes", "Drinks"]
        
        print("\(index + 1). \(typeList[index])")
        
        for item in items {
            print("\(item.name) | W \(item.price) |")
        }
    }
}
