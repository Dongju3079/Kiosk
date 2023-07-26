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
