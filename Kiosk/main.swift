import Foundation

func aaa() {
    print("장바구니 출력")
}

func printer() {
//    DispatchQueue.global().asyncAfter(wallDeadline: .now() + 60) {
//        aaa()
//        printer()
//        print("""
//                          장바구니: \(UserInfo.poket.map({ $0.name }).joined(separator: " ,"))
//                          총 금액: \((UserInfo.poket.reduce(0) { $0 + $1.price }) * 1000)
//             """)
//    }
    
}

func compareTime() -> Bool {
    let calendar = Calendar.current
    let now = Date()
    let components = calendar.dateComponents([.hour, .minute], from: now)
    if let hour = components.hour, let minute = components.minute {
        // 현재 시간이 오후 11시부터 11시 30분 사이인지 확인
        if hour == 23 && minute >= 0 && minute <= 30 { return true }
    }
    return false
}

let closure: () -> Void = {
    print("~~~~~~~~ 3초 대기 ~~~~~~~~")
    //sleep(3)
}

class Kiosk {
    var allMenu = MainName.allCases
    let user = UserInfo()
    
    func order() {
        
        var test: [Menu] = []

        test.append(Menu("Hamburger Little", 10))
        test.append(Menu("Cheeseburger Regular", 10))
        test.append(Menu("스텔라 아르투아", 10))
        test.append(Menu("탄산음료", 10))
        test.append(Menu("바나나", 10))
        test.append(Menu("버드와이저", 10))
        test.append(Menu("초콜릿", 10))
        test.append(Menu("Cheeseburger Regular", 10))
        test.append(Menu("바나나", 10))
        test.append(Menu("바나나", 10))
        test.append(Menu("베지 샌드위치", 10))
        test.append(Menu("치즈베지 샌드위치", 10))
        test.append(Menu("Cheeseburger Regular", 10))
        test.append(Menu("Cheeseburger little", 10))
        test.append(Menu("BLT(베이컨,양상추,토마토) 샌드위치", 10))
        test.append(Menu("땅콩기름에 튀긴 파이브가이즈 스타일 프라이즈 Regular", 10))
        test.append(Menu("땅콩기름에 튀긴 파이브가이즈 스타일 프라이즈 Large", 10))
        test.append(Menu("땅콩기름에 튀긴 파이브가이즈 스타일 프라이즈 Little", 10))
        test.append(Menu("BLT(베이컨,양상추,토마토) 샌드위치", 10))
        test.append(Menu("땅콩기름에 튀긴 파이브가이즈 스타일 프라이즈 Little", 10))
        test.append(Menu("케이준 스타일 프라이즈 Little", 10))
        test.append(Menu("케이준 스타일 프라이즈 Large", 10))
        test.append(Menu("BLT(베이컨,양상추,토마토) 샌드위치", 10))
        test.append(Menu("케이준 스타일 프라이즈 Regular", 10))
        test.append(Menu("케이준 스타일 프라이즈 Regular", 10))
        test.append(Menu("케이준 스타일 프라이즈 Little", 10))
        
        PrintReceipt().printReceipt(payItem: test, remainMoney: 1000000)
        
        printer()
        while true {
            notice()
            
            let userInput = readLine()
            switch userInput {
            case "0":
                print("🖥️ 프로그램을 종료합니다.")
                exit(0)
            case "1":
                OrderManager().orderFoods(type: .burger, userInfo: UserInfo(), completion: closure)
                break
            case "2":
                OrderManager().orderFoods(type: .hotdog, userInfo: UserInfo(), completion: closure)
                break
            case "3":
                OrderManager().orderFoods(type: .sandwiches, userInfo: UserInfo(), completion: closure)
                break
            case "4":
                // 감자튀김
                OrderManager().orderFoods(type: .fries, userInfo: UserInfo(), completion: closure)
                break
            case "5":
                OrderManager().orderFoods(type: .drink, userInfo: UserInfo(), completion: closure)
                break
            case "6":
                OrderManager().orderFoods(type: .shake, userInfo: UserInfo(), completion: closure)
                break
            case "7":
                guard UserInfo.poket.isEmpty != true else {
                    print("‼️ 장바구니가 비었습니다.")
                    continue
                }
                var payment: Payment? = Payment()
                guard let test = payment else { return }
                test.basket(userInfo: user)
                //        OrderManager().pay(userInfo: user)
                payment = nil
            default:
                print("‼️ 숫자로 입력하세요.")
            }
        }
    }
}


extension Kiosk {
    
    // 안내문구
    func notice() {
        print("""

                *---------------------*
                |   FIVE JAYS  MENU   |
                *_____________________*
                | 1. BURGER       🍔  |
                | 2. HOTDOG       🌭  |
                | 3. SANDWICHES   🥪  |
                | 4. FRENCH FRIES 🍟  |
                | 5. DRINK        🥤  |
                | 6. SHAKE        🥛  |
                *_____________________*
                | 7. MY ORDER     🛒  |
                | 0. EXIT         👋🏼  |
                *_____________________*

                """)
        print("🖥️ 메뉴를 입력하세요: ", terminator: "")
        // print("\(allMenu.count + 1). CALCULATION [나의 장바구니]")
        // print("나의 잔고: \(user.money * 1000)")

    }
}

var user = Kiosk()

user.user.updateMoney()

user.order()
