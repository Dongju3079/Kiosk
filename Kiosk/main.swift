import Foundation

class Kiosk {
    
    var test = MainName.allCases
    
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
                // 햄버거
                break
                
            case "2":
                OrderManager().orderFoods(type: .hotdog, userInfo: user)
                break
                
            case "3":
                // 샌드위치
                break
                
            case "4":
                // 감자튀김
                break
                
            case "5":
                OrderManager().orderFoods(type: .drink, userInfo: user)
                break
                
            case "6":
                OrderManager().orderFoods(type: .shake, userInfo: user)
                break
                
            case "7":
                guard UserInfo.poket.isEmpty != true else {
                    print("장바구니가 비었습니다.")
                    continue
                }
                
                var payment: Payment? = Payment()
                
                guard let test = payment else { return }
                test.basket(userInfo: user)
//                OrderManager().pay(userInfo: user)
                payment = nil
                
            default:
                print("올바른 메뉴를 입력해주세요.")
            }
        }
    }
    
    func notice() {
        for i in 0..<test.count {
            print("\(i+1). \(test[i].name) [\(test[i].menuPrice)]")
        }
        
        print("\(test.count + 1). CALCULATION [나의 장바구니]")
        print("0. 종료하기 \n")
        
        print("""
        나의 잔고: \((user.money * 1000))
        장바구니: \(UserInfo.poket.map({ $0.name }).joined(separator: " ,"))
        소요금액: \((UserInfo.poket.reduce(0) { $0 + $1.price }) * 1000)
        """)
    }
}

var user = Kiosk()

user.user.updateMoney()

user.order()

