import Foundation

class HotdogList {
    
    var hotdog: [Menu] = [
        Hotdog("beefHotDog", 8.9),
        Hotdog("cheeseHotDog", 10.4),
        Hotdog("baconHotDog", 11.4),
        Hotdog("baconcheeseHotDog", 12.9)
    ]
    
    func selectBurger(user: UserInfo) {
        
        printHotdogMenu(hotdog)
        // 메인메뉴의 번호를 받아서 해당 메뉴종류 선택받기.
        var loop = true
        
        while loop {
            
            
            let text = readLine()
            
            guard let text = text else { continue }
            guard let intText = Int(text) else {
                print("숫자를 입력해주세요.")
                continue
            }
            
            switch intText {
            case 1...4:
                print("""
                    
                    \(hotdog[intText - 1].name)를 선택하셨습니다.
                    가격 : \(hotdog[intText - 1].price)
                    
                    """)
                
                if user.money > hotdog[intText - 1].price {
                    // 유저 장바구니에 추가하기
                    print("장바구니에 \(hotdog[intText - 1].name) 추가됐습니다.")
                    print(Notice.poketText)
                    user.updatePoket(food: hotdog[intText - 1])
                    
                    // 유저에게 한번 더 묻기
                    let request = readLine()
                    
                    print(Notice.poketText)
                    
                    switch request {
                    case "1":
                        break
                    case "2" :
                        loop = false
                        continue
                    default:
                        print("1번과 2번중 선택하세요.")
                    }
                } else {
                         print("잔액이 부족합니다. (잔액 : \(user.money))") }

            case 5:
                print("메인메뉴로 돌아갑니다.")
                loop = false
            
                break
                
            default:
                print("1에서 4의 숫자를 입력하세요.")
                break
            }
        }
    }
    
    func printHotdogMenu(_ foodList: [Menu]) {
        print("[ Hotdog MENU ]")
        for (index, food) in hotdog.enumerated() {
            print("\(index + 1). \(food.name)  | W \(food.price)")
        }
        print("0. 뒤로가기\n")
    }
}
