//
//  burger.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//

import Foundation

final class PickMenus {
    static var pickedMenus: [Menu] = []
}

class Menu {
    var name: String
    var price: Double
    var sizeUp: Size = .nomal
    
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

class Dogs: Menu {
    
}

// MARK: - User

class UserInfo {
    
    static var poket: [Menu] = []
    
    var money: Double = 0
    
    func updatePoket(food: Menu) {
        Self.poket.append(food)
    }
    
    func removePoket(index: Int) {
        Self.poket.remove(at: index)
    }
    
    func updateMoney() {
        money = floor(Double.random(in: 20...50))
    }
    
    func emptyPoket() {
        Self.poket = []
    }
    
}
