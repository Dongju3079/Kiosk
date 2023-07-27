//
//  model.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//

import Foundation

class Menu {
    var name: String
    var price: Decimal
    var sizeUp: Size = .nomal
    
    init(_ name: String, _ price: Decimal) {
        self.name = name
        self.price = price
    }
}

// MARK: - User

class UserInfo {
    
    static var poket: [Menu] = []
    
    var money: Decimal = 0
    
    lazy var firstMoney = Double.random(in: 30...50)
    
    func updatePoket(food: Menu) {
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
