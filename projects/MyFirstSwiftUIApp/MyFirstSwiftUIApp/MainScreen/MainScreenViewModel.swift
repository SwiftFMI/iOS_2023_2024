//
//  MainScreenViewModel.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/14/23.
//

import Foundation
import Combine

struct Car {
    var name: String
}

class MainScreenViewModel: ObservableObject {
    @Published var a = 1
    @Published var isLoading = false//
    
    @Published var username = ""
    
    var car: Car? = Car(name: "Tesla")
    
    func increment() {
        isLoading = true
        a += 1
        
        print("Username = \(username)")
        
        //async operation ...
        
        // set the new data from the server
        
        isLoading = false
    }
}
