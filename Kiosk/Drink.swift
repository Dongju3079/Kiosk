//
//  Drink.swift
//  Kiosk
//
//  Copyright (c) 2023 z-wook. All right reserved.
//

import Foundation

enum Drink: String, CaseIterable {
    case soda = "탄산음료"
    case water = "생수"
    case budweiser = "버드와이저"
    case stella = "스텔라 아르투아"
    case goose = "구스 아일랜드 IPA"
    
    var drinkName: String { rawValue }
    
    var drinkPrice: Double {
        switch self {
        case .soda:
            return 3.9
        case .water:
            return 2.0
        case .budweiser:
            return 6.0
        case .stella:
            return 7.0
        case .goose:
            return 9.0
        }
    }
}
