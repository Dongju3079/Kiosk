import Foundation

func printer() {
    DispatchQueue.global().asyncAfter(wallDeadline: .now() + 5) {
        printer()
        print("""
        장바구니: \(UserInfo.poket.map({ $0.name }).joined(separator: " ,"))
        총 금액: \((UserInfo.poket.reduce(0) { $0 + $1.price }) * 1000)
        """)
    }
}

let closure: () -> Void = {
    var pocketList: String = ""
    UserInfo.poket.forEach {
        pocketList += $0.name + ", "
    }
    print("🛒 장바구니 🛒")
    print(pocketList)
    print("~~~~~~~~ 3초 대기 ~~~~~~~~")
    //sleep(3)
}

func printHomeKiosk() {
    print("""
            *---------------------*
            |  FIVE JAYS MENU     |
            *_____________________*
            | 1. Burgers   :햄버거: |
            | 2. Hotdog   :핫도그:  |
            | 3. Drinks   :스튜가_담긴_컵: |
            | 4. Sandwiches :샌드위치: |
            | 0. Exit    :손인사::피부톤-3: |
            -----------------------
            """)
}

class Kiosk {
    var allMenu = MainName.allCases
    let user = UserInfo()
    
    func order() {
        printer()
        print("Welcome to FIVE J’s Burger")
        while true {
            notice()
            print("🖥️ 메뉴를 입력하세요: ", terminator: "")
            let userInput = readLine()
            switch userInput {
            case "0":
                print("프로그램을 종료합니다.")
                exit(0)
            case "1":
                OrderManager().orderFoods(type: .burger, userInfo: UserInfo(), completion: closure)
                break
            case "2":
                OrderManager().orderFoods(type: .hotdog, userInfo: UserInfo(), completion: closure)
                break
            case "3":
                // 샌드위치
                break
            case "4":
                // 감자튀김
                break
            case "5":
                OrderManager().orderFoods(type: .drink, userInfo: UserInfo(), completion: closure)
                break
            case "6":
                OrderManager().orderFoods(type: .shake, userInfo: UserInfo(), completion: closure)
                break
            case "7":
                guard UserInfo.poket.isEmpty != true else {
                    print("장바구니가 비었습니다.")
                    continue
                }
                var payment: Payment? = Payment()
                guard let test = payment else { return }
                test.basket(userInfo: user)
                //        OrderManager().pay(userInfo: user)
                payment = nil
            default:
                print(":총격전: 숫자로 입력하세요")
            }
        }
    }
}


extension Kiosk {
    
    // 안내문구
    func notice() {
        printHomeKiosk()
        
        print("\(allMenu.count + 1). CALCULATION [나의 장바구니]")
        print("나의 잔고: \(user.money * 1000)")

    }
}

var user = Kiosk()

user.user.updateMoney()

user.order()
