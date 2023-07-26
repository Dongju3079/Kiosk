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

enum Product: String, CaseIterable {
    case drink = "드링크"
    case shake = "쉐이크"
    case burger = "버거"
    case fries = "감자튀김"
    case sizeup = "사이즈 선택"
    
    var name: String { rawValue }
    
    var productName: [String] {
        switch self {
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
        }
    }
    
    var productPrice: [Double] {
        switch self {
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
        }
    }
    
    private enum Burger: String, CaseIterable {
        case hamburger = "Hamburger"
        case cheeseburger = "Cheeseburger"
        case baconBurger = "Bacon Burger"
        case baconCheeseburger = "Bacon Cheeseburger"
        
        var menuName: String { rawValue }
        
        var menuPrice: Double {
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
        case soda = "탄산음료"
        case water = "생수"
        case budweiser = "버드와이저"
        case stella = "스텔라 아르투아"
        case goose = "구스 아일랜드 IPA"
        
        var menuName: String { rawValue }
        
        var menuPrice: Double {
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
        
        var menuPrice: Double { return 8.9 }
    }
    
    private enum Fries: String, CaseIterable {
        case peanut = "땅콩기름에 튀긴 파이브가이즈 스타일 프라이즈"
        case cajun = "케이준 스타일 프라이즈"
        
        var menuName: String { rawValue }
        
        var menuPrice: Double {
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
        
        var menuPrice: Double {
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
