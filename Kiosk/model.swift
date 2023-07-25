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

class Menu_fries: Menu {
    var size: String = ""
    
    init(name: String, price: Double, size: String) {
        self.size = size
        super.init(name, price)
    }
}
