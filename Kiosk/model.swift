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

class Dogs: Menu {
    
}
class Sandwiches: Menu {
    
}
