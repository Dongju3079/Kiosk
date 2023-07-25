//
//  burger.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//

import Foundation

class Menu {
    var name: String
    var price: Double
    
    init(_ name: String, _ price: Double) {
        self.name = name
        self.price = price
    }
}

class Burger: Menu {
    
    func orderSmallSize() {
        //
    }
}

class Hotdog: Menu {
    
}
class Sandwiches: Menu {
    
}

// MARK: - User

class UserInfo {
    
    var money: Double = 0
    
    var poket: [Menu] = []
    
    func updatePoket(food: Menu) {
        self.poket.append(food)
    }
    
    func updateMoney() {
        money = floor(Double.random(in: 10000...30000))
    }
    
}
