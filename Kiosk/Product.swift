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
    
    var menuPrice: String {
        switch self {
        case .burger:
            return "비프 통살을 다져만든 버거"
        case .hotdog:
            return "매장에서 신선하게 만드는 핫도그"
        case .sandwiches:
            return "홈메이드 샌드위치"
        case .fries:
            return "신선한 감자로 튀긴 감자튀김"
        case .drink:
            return "매장에서 직접 만드는 음료"
        case .shake:
            return "매장에서 직접 만드는 쉐이크"
        }
    }
}

enum Product: String {
    
    case hotdog = "핫도그"
    case drink = "드링크"
    case shake = "쉐이크"
    case sandwiches = "샌드위치"
    
    var name: String { rawValue }
    
    var productName: [String] {
        switch self {
        case .hotdog:
            return Hogdog.allCases.map { $0.menuName }
        case .drink:
            return Drink.allCases.map { $0.menuName }
        case .shake:
            return Shake.allCases.map { $0.menuName }
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
        case .sandwiches:
            return Sandwiches.allCases.map { $0.menuPrice}
        }
    }
    
    private enum Drink: String, CaseIterable {
        case soda = "탄산음료"
        case water = "생수"
        case budweiser = "버드와이저"
        case stella = "스텔라 아르투아"
        case goose = "구스 아일랜드 IPA"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal {
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
    
    private enum Shake: String, CaseIterable {
        case chocolat = "초콜릿"
        case peanutButter = "피넛버터"
        case saltedCaramel = "솔티드 카라멜"
        case banana = "바나나"
        case strawberry = "딸기"
        case oreo = "오레오"
        case rotusBiscope = "로투스 비스코프"
        case bacon = "베이컨"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal { return 8.9 }
    }
    
    private enum Hogdog: String, CaseIterable {
        case beefHotDog = "비프 핫도그"
        case cheeseHotDog = "치즈 핫도그"
        case baconHotDog = "베이컨 핫도그"
        case baconcheeseHotDog = "베이컨 치즈 핫도그"
        
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
        case veggie = "베지 샌드위치"
        case cheeseveggie = "치즈베지 샌드위치"
        case grilledcheese = "그릴드치즈 샌드위치"
        case blt = "BLT(베이컨,양상추,토마토) 샌드위치"
        
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
}
