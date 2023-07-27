//
//  burger.swift
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

class Burger: Menu {
    
    func orderSmallSize() {}
}

class Hotdog: Menu {}
class Drinks: Menu {}
class Milkshakes: Menu {}
class Sandwiches: Menu {}
class Fries: Menu {}


