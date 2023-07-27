//
//  model.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//

import Foundation

// MARK: - 메뉴리스트
class Menu {
    
    var foods: [Food] = []
    
    subscript(index: Int) -> Food {
        return foods[index]
    }
}

extension Menu {
    // 사이즈가 없는
    func nonSizeFoodListUpdate(_ type: Product) -> [Food] {
        for i in type.productName.indices {
            foods.append(NonSize(type.productName[i], type.productPrice[i]))
        }
        return foods
    }
    
    // 사이즈가 있는
    func OnTheSizeFoodListUpdate(_ type: Product) -> [Food] {
        for i in type.productName.indices {
            foods.append(OnTheSize(type.productName[i], type.productPrice[i]))
        }
        return foods
    }
}

// MARK: - 음식종류
class Food {
    var name: String
    var price: Decimal
    
    init(_ name: String,_ price: Decimal) {
        self.name = name
        self.price = price
    }
}

class NonSize: Food {
}

class OnTheSize: Food {
}

// MARK: - User
class UserInfo {
    static var poket: [Food] = []
    var money: Decimal = 0
    lazy var firstMoney = Double.random(in: 30...50)
    
    func updatePoket(food: Food) {
        Self.poket.append(food)
    }
    
    func removePoket(index: Int) {
        Self.poket.remove(at: index)
    }
    
    func updateMoney() {
        let num = round(firstMoney * 10) / 10
        money = Decimal(num)
    }
    
    func emptyPoket() {
        Self.poket = []
    }
}

class Receipt: Menu {
    var count: Int
    var priceSum: Double
    
    init(name: String, price: Decimal, count: Int, priceSum: Double) {
        self.count = count
        self.priceSum = priceSum
        super.init(name, price)
    }
}
