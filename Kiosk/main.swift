//
//  main.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//
//

import Foundation

class Kiosk {
    var allMenu = MainName.allCases
    let user = UserInfo()
    let cartManager = PrintCart()
    let userInfo = UserInfo()
    
    let closure: () -> Void = {
        var pocketList: String = ""
        UserInfo.poket.forEach {
            pocketList += $0.name + ", "
        }
        print("🛒 장바구니 🛒")
        print(pocketList)
        print("~~~~~~~~ 3초 대기 ~~~~~~~~")
        sleep(3)
    }
}


extension Kiosk {
    
    // 키오스크
    func order() {
        
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
                OrderManager().orderFoods(type: .fries, userInfo: UserInfo(), completion: closure)
                break
            case "5":
                OrderManager().orderFoods(type: .drink, userInfo: UserInfo(), completion: closure)
                break
            case "6":
                OrderManager().orderFoods(type: .shake, userInfo: UserInfo(), completion: closure)
                break
            case "7":
                self.basket()
            default:
                print("‼️ 숫자로 입력하세요.")
            }
        }
    }
    
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
        print("🖥️ 나의 잔고: \(user.money * 1000)")
        print("🖥️ 메뉴를 입력하세요: ", terminator: "")
    }
    
    // 장바구니
    func basket() {
        guard UserInfo.poket.isEmpty != true else {
            print("‼️ 장바구니가 비었습니다.")
            return
        }
        
        var payment: Payment? = Payment()
        guard let test = payment else { return }
        test.basket(userInfo: user)
        payment = nil
        
    }
    
    // 60초간격 장바구니 표시
    func printer() {
        DispatchQueue.global().asyncAfter(wallDeadline: .now() + 60) { [weak self] in
            print("\n")
            self?.cartManager.printCart(payItem: UserInfo.poket, remainMoney: (self!.userInfo.money * 1000))
        }
    }
}



var user = Kiosk()

user.user.updateMoney()

user.order()
