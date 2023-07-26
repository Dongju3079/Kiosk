import Foundation

class Kiosk {
    
    let allMenu = MainName.allCases
    let menu = Menu()
    let user = UserInfo()
    
    func order() {
        print("Welcome to FIVE J's Burger")
        while true {
            notice()
            let userInput = readLine()
            
            switch userInput {
            case "0":
                print("프로그램을 종료합니다.")
                exit(0)
            case "1":
                //onTheSizeMene(type: <#T##Product#>) // 햄버거
                break // 기능구현 후 삭제
            case "2":
                nonSizeMene(type: .hotdog)
            case "3":
                //onTheSizeMene(type: <#T##Product#>) // 샌드위치
                break // 기능구현 후 삭제
            case "4":
                //nonSizeMene(type: ) // 감자튀김
                break // 기능구현 후 삭제
            case "5":
                nonSizeMene(type: .drink)
            case "6":
                nonSizeMene(type: .shake)
            case "7":
                basket()
                
            default:
                print("올바른 메뉴를 입력해주세요.")
            }
        }
    }
}

extension Kiosk {
    
    // 사이즈 구별없는 메뉴
    func nonSizeMene(type: Product) {
        let test = menu.nonSizeFoodListUpdate(type)
        OrderManager().orderFoods(foods: test, type: type, userInfo: user)
        menu.foods = []
    }
    
    // 사이즈 구별있는 메뉴
    func onTheSizeMene(type: Product) {
        let test = menu.nonSizeFoodListUpdate(type)
        OrderManager().orderFoods(foods: test, type: type, userInfo: user)
        menu.foods = []
    }
    
    // 안내문구
    func notice() {
        for i in 0..<allMenu.count {
            print("\(i+1). \(allMenu[i].name) [\(allMenu[i].menuPrice)]")
        }
        
        print("\(allMenu.count + 1). CALCULATION [나의 장바구니]")
        print("0. 종료하기 \n")
        
        print("""
        나의 잔고: \((user.money * 1000))
        장바구니: \(UserInfo.poket.map({ $0.name }).joined(separator: " ,"))
        소요금액: \((UserInfo.poket.reduce(0) { $0 + $1.price }) * 1000)
        """)
    }
    
    // 장바구니
    func basket() {
        guard UserInfo.poket.isEmpty != true else {
            print("장바구니가 비었습니다.")
            return
        }
        
        var payment: Payment? = Payment()
        guard let test = payment else { return }
        test.basket(userInfo: user)
        payment = nil
        
    }
}

var user = Kiosk()

user.user.updateMoney()

user.order()

