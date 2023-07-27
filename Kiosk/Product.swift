//
//  Product.swift
//  Kiosk
//
//  Copyright (c) 2023 z-wook. All right reserved.
//

import Foundation

enum Size: String {
    case nomal
    case large
    case little
}

enum MainName: String, CaseIterable {
    case burger = "BURGER"
    case hotdog = "HOTDOG"
    case sandwiches = "SANDWICHES"
    case fries = "FRENCH FRIES"
    case drink = "DRINK"
    case shake = "SHAKE"
    
    
    var name: String { rawValue }
    
    
//    var menuPrice: String {
//        switch self {
//        case .burger:
//            return "비프 통살을 다져만든 버거"
//        case .hotdog:
//            return "매장에서 신선하게 만드는 핫도그"
//        case .sandwiches:
//            return "홈메이드 샌드위치"
//        case .fries:
//            return "신선한 감자로 튀긴 감자튀김"
//        case .drink:
//            return "매장에서 직접 만드는 음료"
//        case .shake:
//            return "매장에서 직접 만드는 쉐이크"
//        }
//    }
    
}

enum Product: String {
    
    case hotdog = "Hotdog"
    case drink = "Drink "
    case shake = "Shake "
    case burger = "Burger"
    case fries = "Fries "
    case sandwiches = "Sandwiches"
    case sizeup = "Select Size"
    
    var name: String { rawValue }
    
    var productName: [String] {
        switch self {
        case .hotdog:
            return Hogdog.allCases.map { $0.menuName }
        case .drink:
            return Drink.allCases.map { $0.menuName }
        case .shake:
            return Shake.allCases.map { $0.menuName }
        case .burger:
            return Burger.allCases.map { $0.menuName }
        case .fries:
            return Fries.allCases.map { $0.menuName }
        case .sizeup:
            return Sizeup.allCases.map { $0.menuName }
        case .sandwiches:
            return Sandwiches.allCases.map { $0.menuName}
        }
    }
    
    var productPrice: [Decimal] {
        switch self {
        case .hotdog:
            return Hogdog.allCases.map { $0.menuPrice }
        case .drink:
            return Drink.allCases.map { $0.menuPrice }
        case .shake:
            return Shake.allCases.map { $0.menuPrice }
        case .burger:
            return Burger.allCases.map { $0.menuPrice }
        case .fries:
            return Fries.allCases.map { $0.menuPrice }
        case .sizeup:
            return Sizeup.allCases.map { $0.menuPrice }
        case .sandwiches:
            return Sandwiches.allCases.map { $0.menuPrice}
        }
    }
    
    private enum Burger: String, CaseIterable {
        case hamburger = "Hamburger"
        case cheeseburger = "Cheese Burger"
        case baconBurger = "Bacon Burger"
        case baconCheeseburger = "Bacon Cheese Burger"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal {
            switch self {
            case .hamburger:
                return 13.4
            case .cheeseburger:
                return 14.9
            case .baconBurger:
                return 15.9
            case .baconCheeseburger:
                return 17.4
            }
        }
    }
    
    private enum Drink: String, CaseIterable {
        case coke = "Coke"
        case water = "Water"
        case budweiser = "Budweiser"
        case stella = "Stella Artois"
        case goose = "Goose Island IPA"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal {
            switch self {
            case .coke:
                return 3.9
            case .water:
                return 1.9
            case .budweiser:
                return 5.9
            case .stella:
                return 6.9
            case .goose:
                return 8.9
            }
        }
    }
    
    private enum Shake: String, CaseIterable {
        case chocolat = "Chocolate"
        case peanutButter = "Peanut Butter"
        case saltedCaramel = "Salted Caramel"
        case banana = "Banana"
        case strawberry = "Strawberry"
        case oreo = "Oreo"
        case rotusBiscope = "Rotus Biscope"
        case bacon = "Bacon"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal { return 8.9 }
    }
    
    private enum Hogdog: String, CaseIterable {
        case beefHotDog = "Beef Hogdog"
        case cheeseHotDog = "Cheese Hogdog"
        case baconHotDog = "Bacon Hogdog"
        case baconcheeseHotDog = "Bacon Cheese Hogdog"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal {
            switch self {
            case .beefHotDog: return 8.9
            case .cheeseHotDog: return 10.4
            case .baconHotDog: return 11.4
            case .baconcheeseHotDog: return 12.9
            }
        }
    }
    
    
    private enum Sandwiches: String, CaseIterable {
        case veggie = "Veggie Sandwich"
        case cheeseveggie = "Cheese Veggie"
        case grilledcheese = "Grilled Cheese"
        case blt = "BLT Sandwich"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal {
            switch self {
            case .veggie:
                return 9.9
            case .cheeseveggie:
                return 11.4
            case .grilledcheese:
                return 8.4
            case .blt:
                return 10.9
            }
        }
    }
    
    private enum Fries: String, CaseIterable {
        case peanut = "Peanut Oil Fries"
        case cajun = "Cajun Style Fries"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal {
            switch self {
            case .peanut:
                return 8.9
            case .cajun:
                return 8.9
            }
        }
    }
    
    private enum Sizeup: String, CaseIterable {
        case little = "Little"
        case regular = "Regular"
        case large = "Large"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal {
            switch self {
            case .little:
                return -2.0
            case .regular:
                return 0.0
            case .large:
                return 2.0
            }
        }
    }
}
