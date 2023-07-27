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

class Receipt: Menu {
    var count: Int
    var priceSum: Double
    
    init(name: String, price: Double, count: Int, priceSum: Double) {
        self.count = count
        self.priceSum = priceSum
        super.init(name, price)
    }
}
