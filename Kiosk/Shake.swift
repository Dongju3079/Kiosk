//
//  Shake.swift
//  Kiosk
//
//  Copyright (c) 2023 z-wook. All right reserved.
//

import Foundation

enum Shake: String, CaseIterable {
    case chocolat = "초콜릿"
    case peanutButter = "피넛버터"
    case saltedCaramel = "솔티드 카라멜"
    case banana = "바나나"
    case strawberry = "딸기"
    case oreo = "오레오"
    case rotusBiscope = "로투스 비스코프"
    case bacon = "베이컨"
    
    var drinkName: String { rawValue }
    
    var drinkPrice: Double { return 8.9 }
}
