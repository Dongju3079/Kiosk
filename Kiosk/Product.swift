import Foundation

enum Size: String {
    case nomal
    case large
    case little
}

enum Product: String, CaseIterable {
    case burgers = "햄버거"
    case hotdogs = "핫도그"
    case drink = "드링크"
    case shake = "쉐이크"
    case sandwiches = "샌드위치"
    case fries = "감자튀김"
    case sizeup = "사이즈 선택"
    
    
    var name: String { rawValue }
    
    var productName: [String] {
        switch self {
        case .burgers:
            return Burger.allCases.map { $0.menuName }
        case .hotdogs:
            return Hotdog.allCases.map { $0.menuName }
        case .drink:
            return Drink.allCases.map { $0.menuName }
        case .shake:
            return Shake.allCases.map { $0.menuName }
        case .sandwiches:
            return Sandwiches.allCases.map { $0.menuName }
        case .fries:
            return Fries.allCases.map { $0.menuName }
        case .sizeup:
            return Sizeup.allCases.map { $0.menuName }
        }
    }
    
    var productPrice: [Decimal] {
        switch self {
        case .burgers:
            return Burger.allCases.map { $0.menuPrice }
        case .hotdogs:
            return Hotdog.allCases.map { $0.menuPrice }
        case .drink:
            return Drink.allCases.map { $0.menuPrice }
        case .shake:
            return Shake.allCases.map { $0.menuPrice }
        case .sandwiches:
            return Sandwiches.allCases.map { $0.menuPrice }
        case .fries:
            return Fries.allCases.map { $0.menuPrice }
        case .sizeup:
            return Sizeup.allCases.map { $0.menuPrice }
        }
    }
    
    private enum Burger: String, CaseIterable {
        case hamburger = "햄버거"
        case cheeseburger = "치즈 버거"
        case baconburger = "베이컨 버거"
        case baconcheeseburger = "베이컨 치즈 버거"
        
        var menuName: String { rawValue }
        
        var menuPrice: Decimal {
            switch self {
            case .hamburger:
                return 13.4
            case .cheeseburger:
                return 14.9
            case .baconburger:
                return 15.9
            case .baconcheeseburger:
                return 17.4
            }
        }
    }
    
    private enum Hotdog: String, CaseIterable {
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
    
    private enum Fries: String, CaseIterable {
            case peanut = "땅콩기름에 튀긴 파이브가이즈 스타일 프라이즈"
            case cajun = "케이준 스타일 프라이즈"
            
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
