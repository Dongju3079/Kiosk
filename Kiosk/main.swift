//
//  main.swift
//  Kiosk
//
//  Created by daelee on 2023/07/24.
//

import Foundation

class Kiosk {
    
    var test = MainName.allCases
    
    let payment = Payment()
    
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
                OrderManager().orderDrinks(type: .hotdog, userInfo: user)
                break
            case "3":
                // 샌드위치
                break
            case "4":
                // 감자튀김
                break
            case "5":
                OrderManager().orderDrinks(type: .drink, userInfo: user)
                break
            case "6":
                OrderManager().orderDrinks(type: .shake, userInfo: user)
                break
            case "7":
                payment.pay(userInfo: user)
//                OrderManager().pay(userInfo: user)
                
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
        나의 잔고: \(floor(user.money * 1000))
        장바구니: \(UserInfo.poket.map({ $0.name }).joined(separator: " ,"))
        소요금액: \(floor(UserInfo.poket.reduce(0) { $0 + $1.price }) * 1000)
        """)
    }
    
    
    
   
    
    
}

var user = Kiosk()

user.user.updateMoney()

user.order()

