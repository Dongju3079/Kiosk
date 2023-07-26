//
//  receipt.swift
//  Kiosk
//
//  Created by t2023-m0059 on 2023/07/25.
//

import Foundation

class PrintReceipt {
    func printReceipt(payItem: [Menu], remainMoney: Double){
        print("---------- 영수증 ---------")
        // 결제 시간
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var currentDate = formatter.string(from: Date())
        print("결제 시간 : \(currentDate)")
        print("-------------------------")
        print("상품명 / 단가 / 수량 / 금액")
        
        var sumItem: Double = 0
        // 각
        var payItem_burgers: [Menu] = []
        var payItem_dogs: [Menu] = []
        var payItem_sandwiches: [Menu] = []
        var payItem_fries: [Menu] = []
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
            } else if(Product.fries.productName.contains(item.name)) {
                // 감자튀김
                payItem_fries.append(item)
            } else if(Product.fries.productName.contains(item.name)) {
                // 밀크쉐이크
                payItem_milkshakes.append(item)
            } else if(Product.fries.productName.contains(item.name)) {
                // 음료
                payItem_drinks.append(item)
            }
            sumItem += item.price
        }
        
        // 버거
        displayItem(index: 0, items: payItem_burgers)
        // 핫도그
        displayItem(index: 1, items: payItem_burgers)
        // 샌드위치
        displayItem(index: 2, items: payItem_burgers)
        // 감자튀김
        displayItem(index: 3, items: payItem_burgers)
        // 밀크쉐이크
        displayItem(index: 4, items: payItem_burgers)
        // 마실 것
        displayItem(index: 5, items: payItem_burgers)
        
        print("--------------------------")
        print("총 품목 수량 : \(payItem.count)")
        var sumPrice: Double = sumItem * 1000
        print("총 품목 금액 : \(Int(sumPrice))원")
        // 부가세 (10%)
        var surtax: Int = Int(sumPrice * 0.1)
        print("부가세(10%) : \(surtax)원")
        var payment: Int = Int(sumPrice) + surtax
        print("합계 : \(payment)원")
        print("--------------------------")
        print("결제 방식 : 현금")
        print("현재 금액 : \(payment + Int(remainMoney))원")
        print("결제 대상 금액 : \(payment)원")
        print("남은 금액 : \(Int(remainMoney))원")
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
