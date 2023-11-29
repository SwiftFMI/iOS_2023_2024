//
//  MyFirstSwiftUIAppApp.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 10/09/23.
//

import SwiftUI

@main
struct MyFirstSwiftUIAppApp: App {
    
//    @UIApplicationDelegateAdaptor var delegate: C
    
    var body: some Scene {
        WindowGroup {
//            MainScreenView()
//            FirstScreenView()
//            LoginScreenView()
//            CanvasDemoView()
            HomeScreenView()
        }
    }
}


//singleton

class MySingleton {
    private static var _instance = MySingleton()
    private var myData = 100
    
    private init() {
        
    }
    
    static var instance: MySingleton {
        set {
            _instance = newValue
        }
        get {
            _instance
        }
    }
    
    func printMe() {
        print("V: \(myData)")
    }
    
    func getData() -> Int {
        return myData
    }
    
    func setData(v: Int) {
        myData = v
    }
}
